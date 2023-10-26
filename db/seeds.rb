# seeds.rb

# Categories
categories = [
  { category_name: "Action" },
  { category_name: "Comedy" },
  { category_name: "Drama" },
  { category_name: "Sci-Fi" },
  { category_name: "Horror" }
]

Category.create(categories)
puts "Categories created"

# Theaters
theaters = [
  { theater_name: "Theater A", city: "New York", theater_address: "123 Main St" },
  { theater_name: "Theater B", city: "Los Angeles", theater_address: "456 Elm St" },
  { theater_name: "Theater C", city: "Chicago", theater_address: "789 Oak St" }
]

Theater.create(theaters)
puts "Theaters created"

# # Users
# users = [
#   { email: "user1@example.com", password: "password" },
#   { email: "user2@example.com", password: "password" },
#   { email: "user3@example.com", password: "password" }
# ]

# User.create(users)
# puts "Users created"

# Movies
movies = [
  {
    movie_title: "Sample Movie 1",
    movie_description: "Description of Sample Movie 1",
    movie_duration: 120,
    movie_language: "English",
    movie_release_date: Date.new(2023, 1, 1),
    movie_country: "United States",
    movie_rating: 4,
    category: Category.first,
    theater: Theater.first,
  },
  {
    movie_title: "Sample Movie 2",
    movie_description: "Description of Sample Movie 2",
    movie_duration: 110,
    movie_language: "Spanish",
    movie_release_date: Date.new(2023, 2, 15),
    movie_country: "Spain",
    movie_rating: 3,
    category: Category.second,
    theater: Theater.second,
  }
]

Movie.create(movies)
puts "Movies created"

# Shows
shows = [
  {
    show_date: Date.new(2023, 3, 1),
    show_time: "18:00:00",
    movie: Movie.first,
    theater: Theater.first
  },
  {
    show_date: Date.new(2023, 3, 1),
    show_time: "20:00:00",
    movie: Movie.second,
    theater: Theater.second
  }
]

Show.create(shows)
puts "Shows created"
