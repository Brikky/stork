class AddsStockForItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :stock, :integer
  end
end
