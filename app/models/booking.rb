class Booking < ApplicationRecord
  validates :number_of_seats, presence:true
  
  belongs_to :show
  belongs_to :user
  belongs_to :movie
  belongs_to :theater

  after_create :update_show_seats_count

  def update_show_seats_count
    show.update(remaining_seats: show.total_seats - number_of_seats)
  end
  
end