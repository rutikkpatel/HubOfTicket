class CreateTheaters < ActiveRecord::Migration[7.1]
  def change
    create_table :theaters do |t|
      t.string :theater_name
      t.string :city
      t.text :theater_address
      t.belongs_to :movie

      t.timestamps
    end
  end
end
