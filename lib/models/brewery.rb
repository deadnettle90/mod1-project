class Brewery < ActiveRecord::Base
    has_many :user_breweries
    has_many :users, through: :user_breweries
end