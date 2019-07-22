class User < ApplicationRecord
    has_many :wishlists
    has_many :wishlist_restaurants, -> { distinct }, through: :wishlists, class_name: "Restaurant", source: :restaurant
    has_many :favourites
    has_many :favourite_restaurants, -> { distinct }, through: :favourites, class_name: "Restaurant", source: :restaurant
    has_many :reviews
    has_many :reviewed_restaurants, -> { distinct }, through: :reviews, class_name: "Restaurant", source: :restaurant
    has_many :bookings
    has_many :booked_restaurants, -> { distinct }, through: :bookings, class_name: "Restaurant", source: :restaurant

    has_secure_password

    validates :password, presence: true, length: { in: 6..20 }
    validates :username, presence: true, uniqueness: true
    # validates :name, presence: true, length: { minimum: 2 }


end
