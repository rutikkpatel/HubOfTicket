class Movie < ApplicationRecord
  has_many :theaters
  belongs_to :category
end
