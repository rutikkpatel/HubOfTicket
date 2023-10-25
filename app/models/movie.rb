class Movie < ApplicationRecord
  has_one_attached :image

  has_many :shows , through: :theater
  has_many :theaters
  has_many :bookings
  belongs_to :category
  belongs_to :theater
end