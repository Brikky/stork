class Order < ApplicationRecord
  enum status: [:open, :paid, :shipped]
  belongs_to :user, optional: true
  has_many :items, through: :order_items
  has_many :order_items, dependent: :destroy

  def order_total
    if open?
      order_items.map { |oi| oi.item[:price] * oi[:quantity].to_f }.reduce(0.0, :+)
    else
      order_items.map { |oi| oi[:purchase_price] * oi[:quantity].to_f }.reduce(0.0, :+)
    end
  end

  def handle_payment
    self.status = 'paid'
    order_items.each do |oi|
      oi.purchase_price = oi.item.price
      oi.item.stock -= oi.quantity
      oi.save
    end
  end

  def merge_order(order)
    return if id == order.id
    order.order_items.each do |oi|
      oi.order_id = id
      order_items.push(oi)
    end
    save
    order.delete
  end

  def items_unavailable
    check_stock = []
    order_items.each do |oi|
      check_stock << oi.item.name if oi.quantity > oi.item.stock
    end

    check_stock
  end

  def amount_available
    stock_amount = []
    order_items.each do |oi|
      stock_amount << oi.item.stock if oi.quantity > oi.item.stock
    end
    stock_amount
  end
end
