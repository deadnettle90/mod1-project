class User < ActiveRecord::Base
    has_many :user_breweries
    has_many :breweries, through: :user_breweries
end