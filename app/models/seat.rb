class Seat < ApplicationRecord
  belongs_to :booking
  belongs_to :show
end