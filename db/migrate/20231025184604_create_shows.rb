class CreateShows < ActiveRecord::Migration[7.1]
  def change
    create_table :shows do |t|
      t.date :show_date
      t.datetime :show_time
      t.belongs_to :movie
      t.belongs_to :theater

      t.timestamps
    end
  end
end
