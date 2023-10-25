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
  end
end
