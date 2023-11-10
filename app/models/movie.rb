class Movie < ApplicationRecord
  validates :movie_title, :movie_description, :movie_duration, :movie_language, :movie_release_date, :movie_rating, :category_id, presence: true

  has_one_attached :image

  has_many :shows #, through: :theater
  has_many :theaters
  has_many :bookings
  belongs_to :category
  belongs_to :theater
end