class UserController < ApplicationController
  def show
    @user = current_user
    @followed_shows = @user.followed_shows
    @show_progress = {}
    @followed_shows.each do |show|
      @progresses = @user.progresses.map(&:episode_id)
      @episodes = show.show.episodes.map(&:id)
      @merged = @episodes & @progresses
      @show_progress[show] = Episode.find(@merged)
    end
    @reviews = Review.where(user: current_user)
  end
end
