class Show < ActiveRecord::Base
    has_many :watchlists
    has_many :users, through: :watchlists
    has_many :starrings
    has_many :actors, through: :starrings
    has_many :reviews
    has_many :users, through: :reviews

    def rating
        rating_sum = self.reviews.reduce(0) do |sum, review|
            sum + review.rating
        end
        rating_average = rating_sum / self.reviews.count.to_f
        rating_average.nan? ? 0 : rating_average.ceil(2)
    end

    def self.genres
        self.all.map do |show|
            show.genre
        end
    end
end