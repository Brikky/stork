require 'rails_helper'


RSpec.describe Item, :type => :model do


  describe "::new" do
    subject(:item) { Item.new }

    it "creates new item" do
      expect(item).to be_a(Item)
    end

    it "it's name is Candy" do
      item.name ="Candy"
      expect(item.name).to eq("Candy")
    end

    it "it's description is : it's very tasty" do
      item.description ="it's very tasty"
      expect(item.description).to eq("it's very tasty")
    end

    it "it's price is 19.99" do
      item.price = 19.99
      expect(item.price).to eq(19.99)
    end

    it "there are 10 of this item is stock" do
      item.stock = 10
      expect(item.stock).to eq(10)
    end

    it "should belong to many order-items" do
     t = Item.reflect_on_association(:order_items)
     t.macro.should == :has_many
    end

    it "should belong to many orders" do
     t = Item.reflect_on_association(:orders)
     t.macro.should == :has_many
    end

  end

end