class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :items, through: :order_items
  has_many :order_items
end
