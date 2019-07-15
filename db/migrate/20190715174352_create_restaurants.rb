class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :address
      t.string :city
      t.integer :city_id
      t.string :featured_image
      t.decimal :latitude
      t.decimal :longitude
      t.integer :country_id
      t.float :average_cost_for_two
      t.string :currency
      t.string :cuisines
      t.float :aggregate_rating
      t.integer :all_reviews_count

      t.timestamps
    end
  end
end
