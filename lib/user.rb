class User < ActiveRecord::Base 
    has_many :watchlists
    has_many :shows, through: :watchlists
    has_many :reviews
    # has_many :shows, through: :reviews
end