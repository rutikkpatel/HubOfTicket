class AddRemainingSeatsToShows < ActiveRecord::Migration[7.1]
  def change
    add_column :shows, :remaining_seats, :integer
  end
end
