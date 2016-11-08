class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  after_create :new_current_order

  def current_order
    self.orders.find_by(status: 'open')
  end

  def new_current_order
    Order.create({status:'open',user_id: self.id})
  end
end
