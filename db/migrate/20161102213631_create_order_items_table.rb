class CreateOrderItemsTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :items, :orders
  end
end
