class Theater < ApplicationRecord
  validates :theater_name, :city, :theater_address, presence: true

  has_many :bookings, dependent: :destroy
  has_many :movies, dependent: :destroy
  has_many :shows, dependent: :destroy
end