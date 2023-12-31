class Show < ApplicationRecord
  validates :show_date, :show_time, :total_seats, :show_price, presence: true

  has_many :bookings, dependent: :destroy
  belongs_to :movie
  belongs_to :theater
end