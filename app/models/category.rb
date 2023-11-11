class Category < ApplicationRecord
  validates :category_name , presence: true
  
  has_many :movies, dependent: :destroy
end