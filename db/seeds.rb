# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

shows = Show.create!([
  {
    name: 'Succession',
    rating: 9.8,
    summary: 'good show',
    number_of_seasons: 4
  },
  {
    name: 'Great British Bake Off',
    rating: 9.7,
    summary: 'good show',
    number_of_seasons: 10
  },
  {
    name: 'Friends',
    rating: 9.6,
    summary: 'good show',
    number_of_seasons: 9
  }
])
