class Screen < ApplicationRecord
  has_many :seats
  belongs_to :movie
  belongs_to :theater
end
