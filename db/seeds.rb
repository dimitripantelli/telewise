require 'open-uri'
require 'json'
require 'net/http'
require 'openssl'

Show.destroy_all
Episode.destroy_all
SeasonSummary.destroy_all

show_ids = %w[23470 175 169 73 525 58 32 527 139]

puts 'Adding shows and episodes...'

show_ids.each do |id|
  # API requests
  show = JSON.parse(URI.open("https://api.tvmaze.com/shows/#{id}?embed=seasons").read)
  episodes = JSON.parse(URI.open("https://api.tvmaze.com/shows/#{id}/episodes").read)
  imdb_id = show['externals']['imdb']
  url_gb = URI("https://streaming-availability.p.rapidapi.com/get/basic?country=gb&imdb_id=#{imdb_id}&output_language=en")
  url_us = URI("https://streaming-availability.p.rapidapi.com/get/basic?country=us&imdb_id=#{imdb_id}&output_language=en")

  http_gb = Net::HTTP.new(url_gb.host, url_gb.port)
  http_gb.use_ssl = true
  http_gb.verify_mode = OpenSSL::SSL::VERIFY_NONE
  http_us = Net::HTTP.new(url_us.host, url_us.port)
  http_us.use_ssl = true
  http_us.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request_gb = Net::HTTP::Get.new("/get/basic?country=gb&imdb_id=#{imdb_id}&output_language=en")
  request_gb["x-rapidapi-host"] = 'streaming-availability.p.rapidapi.com'
  request_gb["x-rapidapi-key"] = ENV["RAPID_API_KEY"]
  request_us = Net::HTTP::Get.new("/get/basic?country=us&imdb_id=#{imdb_id}&output_language=en")
  request_us["x-rapidapi-host"] = 'streaming-availability.p.rapidapi.com'
  request_us["x-rapidapi-key"] = ENV["RAPID_API_KEY"]

  p response_gb = JSON.parse(http_gb.request(request_gb).read_body)
  response_us = JSON.parse(http_us.request(request_us).read_body)

  streaming = []
  streaming << response_gb['streamingInfo']
  if response_gb['streamingInfo'] && response_gb['streamingInfo'].first[0] != response_us['streamingInfo'].first[0]
    streaming << response_us['streamingInfo']
  end

  # Create show using JSON
  new_show = Show.create!(
    name: show['name'],
    summary: response_gb['overview'],
    number_of_seasons: show['_embedded']['seasons'].count,
    streaming: streaming,
    rating: show['rating']['average']
  )

  # Add poster to asset file
  download = URI.open(show['image']['original'])
  IO.copy_stream(download, "app/assets/images/#{show['name'].gsub(/\s+/, '')}.jpg")

  # Check new show was saved
  next unless new_show.persisted?

  # Add season summaries
  show['_embedded']['seasons'].each do |season|
    new_show.season_summaries.create!(
      season_number: season['number'],
      summary: season['summary']
    )
  end

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

  puts "added #{new_show.name}"
end

puts '...Finished!'

# TEMP FOLLWED SHOWS
# FollowedShow.destroy_all
# Progress.destroy_all
# puts 'creating followed shows'

# succession = Show.find_by(name: 'Succession')
# house_of_cards = Show.find_by(name: 'House of Cards')
# breaking_bad = Show.find_by(name: 'Breaking Bad')

# following = FollowedShow.create!([
#   {
#     user_id: 1,
#     show_id: succession.id
#   },
#   {
#     user_id: 1,
#     show_id: house_of_cards.id
#   },
#   {
#     user_id: 1,
#     show_id: breaking_bad.id
#   },
# ])

# progresses = Progress.create!([
#   {
#     user_id: 1,
#     episode_id: succession.episodes.first.id
#   },
#   {
#     user_id: 1,
#     episode_id: house_of_cards.episodes.third.id
#   },
#   {
#     user_id: 1,
#     episode_id: breaking_bad.episodes.second.id
#   },
# ])
