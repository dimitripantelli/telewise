require 'open-uri'
require 'json'
require 'net/http'
require 'openssl'

show_ids = %w[23470 175 169 73 525 58 32 527 826 139]

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

  request_gb = Net::HTTP::Get.new(url_gb)
  request_gb["x-rapidapi-host"] = 'streaming-availability.p.rapidapi.com'
  request_gb["x-rapidapi-key"] = ENV["RAPID_API_KEY"]
  request_us = Net::HTTP::Get.new(url_us)
  request_us["x-rapidapi-host"] = 'streaming-availability.p.rapidapi.com'
  request_us["x-rapidapi-key"] = ENV["RAPID_API_KEY"]

  response_gb = http.request(request_gb)
  response_us = http.request(request_us)

  streaming = []
  streaming << response_gb[:streamingInfo]
  if response_gb[:streamingInfo].first[0] != response_us[:streamingInfo].first[0]
    streaming << response_us[:streamingInfo]
  end

  # Create show using JSON
  new_show = Show.create(
    name: show['name'],
    summary: response_gb[:overview],
    number_of_seasons: show['_embedded']['seasons'].count,
    streaming: streaming
  )
  # Check new show was saved
  next unless new_show.persisted?

  # For that show, associate these episodes
  episodes.each do |ep|
    new_show.episodes.create(
      episode_number: ep['number'],
      season_number: ep['season'],
      name: ep['name'],
      description: ep['summary'],
      airing_date: ep['airdate']
    )
  end
end

puts '...Finished!'
