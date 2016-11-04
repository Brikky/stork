class Order < ApplicationRecord
  enum status: [:open, :paid, :shipped]
  belongs_to :user, optional: true
  has_many :items, through: :order_items
  has_many :order_items, dependent: :destroy

  def self.current_order
  	Order.find(session[:order_id])
  end

	def order_total
		self.order_items.map {|oi| oi.item[:price] * oi[:quantity]}.reduce(0,:+)
	end
end
