# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

show_ids = %w[23470 175 169 73 525 58 32 527 826 139]

puts 'Adding shows and episodes...'

show_ids.each do |id|
  # JSON urls
  show = JSON.parse(URI.open("https://api.tvmaze.com/shows/#{id}?embed=seasons").read)
  episodes = JSON.parse(URI.open("https://api.tvmaze.com/shows/#{id}/episodes").read)
  # Create show using JSON
  new_show = Show.create!(
    name: show['name'],
    rating: show['rating']['average'],
    summary: show['summary'],
    number_of_seasons: show['_embedded']['seasons'].count
  )
  # Check new show was saved
  next unless new_show.persisted?

  # For that show, associate these episodes
  episodes.each do |ep|
    new_show.episodes.create!(
      episode_number: ep['number'],
      season_number: ep['season'],
      name: ep['name'],
      description: ep['summary'],
      airing_date: ep['airdate']
    )
  end
end

puts '...Finished!'
