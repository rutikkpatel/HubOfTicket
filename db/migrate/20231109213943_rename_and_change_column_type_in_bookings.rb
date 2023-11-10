class RenameAndChangeColumnTypeInBookings < ActiveRecord::Migration[7.1]
  def up
    # Add a new column with the desired datatype
    add_column :bookings, :selected_seats, :string

    # Copy the data from the old column to the new column
    Booking.update_all('selected_seats = CAST(booking_date AS VARCHAR)')

    # Remove the old column
    remove_column :bookings, :booking_date
  end

  def down
    # Add the old column back with its original datatype
    add_column :bookings, :booking_date, :date

    # Copy the data from the new column to the old column
    Booking.update_all('booking_date = CAST(selected_seats AS DATE)')

    # Remove the new column
    remove_column :bookings, :selected_seats
  end
end
