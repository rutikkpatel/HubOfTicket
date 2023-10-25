class Movie < ApplicationRecord
  has_one_attached :image

  has_many :shows
  has_many :theaters, through: :shows
end
