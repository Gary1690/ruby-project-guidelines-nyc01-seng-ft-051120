class User < ActiveRecord::Base 
    has_many :watchlists
    has_many :shows, through: :watchlists
end