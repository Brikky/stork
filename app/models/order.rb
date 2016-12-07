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

  def update_to_paid
    self.update_attribute(:status, 'paid')
    order_items.each do |oi|
      oi.purchase_price = oi.item.price
      oi.item.stock -= oi.quantity
      oi.save
    end
  end

  def self.current(order_id, user=nil) # from session // current_user
    if user
      order = user.orders.find_by(status: 0)
      if order
        order
      else
        Order.create(user_id: user.id)
      end
    elsif order_id.blank? || order_id.nil?
      Order.create()
    else
      Order.find(order_id)
    end
 end

  def merge(order)
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
