class Booking < ApplicationRecord
  belongs_to :show
  belongs_to :user
  belongs_to :movie
  belongs_to :theater
end