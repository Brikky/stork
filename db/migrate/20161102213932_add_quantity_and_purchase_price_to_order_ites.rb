class AddQuantityAndPurchasePriceToOrderItes < ActiveRecord::Migration[5.0]
  def change
    add_column :items_orders, :quantity, :integer
    add_column :items_orders, :purchase_price, :float
  end
end
