class AddPurchasePriceToOrderItems < ActiveRecord::Migration[5.0]
  def change
  	add_column :order_items, :purchase_price, :float
  end
end
