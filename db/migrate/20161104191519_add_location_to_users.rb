class AddLocationToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :full_address, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zipcode, :integer
    add_column :users, :country, :string
    add_column :users, :latitude, :string
    add_column :users, :longitude, :string
  end
end
