class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :movie_title
      t.text :movie_description
      t.integer :movie_duration
      t.string :movie_language
      t.date :movie_release_date
      t.string :movie_country
      t.integer :movie_category
      t.integer :movie_rating

      t.timestamps
    end
  end
end