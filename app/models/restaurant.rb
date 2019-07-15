class Restaurant < ApplicationRecord
    has_many :wishlists
    has_many :users, through: :wishlists
    has_many :favourites
    has_many :users, through: :favourites
    has_many :reviews
    has_many :users, through: :reviews
    has_many :bookings
    has_many :users, through: :bookings

end
