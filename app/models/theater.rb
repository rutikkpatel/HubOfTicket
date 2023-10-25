class Theater < ApplicationRecord
  has_many :bookings
  has_many :movies
  has_many :shows
end
