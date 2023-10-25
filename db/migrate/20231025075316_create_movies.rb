class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :movie_title
      t.text :movie_description
      t.integer :movie_duration
      t.string :movie_language
      t.date :movie_release_date
      t.string :movie_country
      t.string :movie_generation
      t.integer :movie_rating
      t.integer :category_id

      t.timestamps
    end

    create_table :shows do |t|
      t.date :show_date
      t.time :show_time
      t.belongs_to :movie
      t.belongs_to :theater

      t.timestamps
    end

    create_table :theaters do |t|
      t.string :theater_name
      t.string :city
      t.text :theater_address

      t.timestamps
    end
  end
end
