class Theater < ApplicationRecord
  validates :theater_name, :city, :theater_address, presence: true

  has_many :bookings
  has_many :movies
  has_many :shows
end
