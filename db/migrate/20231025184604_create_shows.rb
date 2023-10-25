class CreateShows < ActiveRecord::Migration[7.1]
  def change
    create_table :shows do |t|
      t.date :show_date
      t.time :show_time
      t.references :movie, null: false, foreign_key: true
      t.references :theater, null: false, foreign_key: true

      t.timestamps
    end
  end
end
