class CreateSeats < ActiveRecord::Migration[7.1]
  def change
    create_table :seats do |t|
      t.integer :no_of_seats
      t.references :screen, null: false, foreign_key: true

      t.timestamps
    end
  end
end
