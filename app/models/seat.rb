class Seat < ApplicationRecord
  has_many :bookings
  belongs_to :screen
end
