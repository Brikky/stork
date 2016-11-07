class Order < ApplicationRecord
  enum status: [:open, :paid, :shipped]
  belongs_to :user, optional: true
  has_many :items, through: :order_items
  has_many :order_items, dependent: :destroy

  def order_total
    if status == 'open'
      order_items.map { |oi| oi.item[:price] * oi[:quantity].to_f }.reduce(0.0, :+)
    else
      order_items.map { |oi| oi[:purchase_price] * oi[:quantity].to_f }.reduce(0.0, :+)
    end
  end

  def handle_payment
    order_items.each { |oi| oi.purchase_price = oi.item.price; oi.save }
  end
end
