class RemoveColumnsFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :name, :string
    remove_column :restaurants, :address, :text
    remove_column :restaurants, :city, :string
    remove_column :restaurants, :city_id, :integer
    remove_column :restaurants, :featured_image, :string
    remove_column :restaurants, :latitude, :decimal
    remove_column :restaurants, :longitude, :decimal
    remove_column :restaurants, :country_id, :integer
    remove_column :restaurants, :average_cost_for_two, :float
    remove_column :restaurants, :currency, :string
    remove_column :restaurants, :cuisines, :string
    remove_column :restaurants, :aggregate_rating, :float
    remove_column :restaurants, :all_reviews_count, :integer
    remove_column :restaurants, :restaurant_id, :integer
  end
end
