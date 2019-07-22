class AddRestaurantApiIdToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :restaurant_api_id, :integer
  end
end
