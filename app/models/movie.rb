class Movie < ApplicationRecord
  enum :movie_category, [:action, :thrill, :comdey, :scifi]

  has_one_attached :image

  has_many :shows , through: :theater
  has_many :theaters
  has_many :bookings
end