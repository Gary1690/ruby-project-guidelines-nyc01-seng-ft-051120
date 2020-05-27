class Starring < ActiveRecord::Base 
    belongs_to :actor 
    belongs_to :show
end