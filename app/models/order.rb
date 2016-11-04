class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :items, through: :order_items
  has_many :order_items, dependent: :destroy


	def order_total
		self.order_items.map {|oi| oi.item[:price] * oi[:quantity]}.reduce(0,:+)
	end
end
