# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FollowedShow.destroy_all
Episode.destroy_all
Progress.destroy_all

followed = FollowedShow.create!({
  user_id: 1,
  show_id: 1
})

episode = Episode.create!({
  show_id: 1,
  season_number: 2,
  name: 'Jess does something quirky',
  episode_number: 6
})

progress = Progress.create!({
  user_id: 1,
  episode_id: 1
})
