class User < ApplicationRecord
    has_many :wishlists
    has_many :restaurants, through: :wishlists
    has_many :favourites
    has_many :restaurants, through: :favourites
    has_many :reviews
    has_many :restaurants, through: :reviews
    has_many :bookings
    has_many :restaurants, through: :bookings

    has_secure_password

    validates :password, presence: true
    validates :password, length: { in: 6..20 }
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :name, presence: true
    validates :name, length: { minimum: 2 }


end
