class Item < ApplicationRecord
  has_many :orders, through: :order_items
  has_many :order_items
  has_attached_file :photo
  has_attached_file :image, styles: { medium: "235x235>", thumb: "100x100>" }, default_url: '/stork.png'
  validates_attachment :image,
  			content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  attr_accessor :photo_file_name
end
