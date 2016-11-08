require 'rails_helper'


RSpec.describe Order, :type => :model do

	describe "::new" do
    it "initializes a new order" do
      order = Order.new
      expect(order).to be_a(Order)
    end
  end
  describe "#status" do
    it "displays integer that reflects order status" do
      order = Order.new
      order.status = 0
      expect(order.status).to eq("open")
    end
  end	  
  describe "#user_id" do
    it "displays user associated with order" do
      user = User.new
      user.id = 1
      order = user.order.create()
      expect(order.user_id).to eq(1)
    end
  end

end
