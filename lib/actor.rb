class Actor < ActiveRecord::Base 
    has_many :starrings
    has_many :shows, through: :starrings
end