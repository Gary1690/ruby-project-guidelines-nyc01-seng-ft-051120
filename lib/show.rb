class Show < ActiveRecord::Base
    has_many :watchlists
    has_many :users, through: :watchlists
    has_many :starrings
    has_many :actors, through: :starrings
end