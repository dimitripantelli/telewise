class FollowedShowsController < ApplicationController
  before_action :find_show, only: [:new, :create]

  def new
    @followed_show = FollowedShow.new
  end

  def create
    @followed_show = FollowedShow.new
    @followed_show.show = @show
    @followed_show.user = current_user
    if @followed_show.save
      future_airing = check_air_date(@followed_show)
      future_airing.each do |episode|
        Notification.create!(
          episode_id: episode.id,
          user_id: current_user.id
        )
      end
    end
    user_shows = current_user.followed_shows.map(&:show_id)
    @followed_show.save if user_shows.exclude?(@followed_show.show.id)
    # show message saying you've added
    # redirect_to show_path(@show)
  end

  def destroy
    show = Show.find(params[:id])
    show.followed_shows.find_by(user: params[:user_id]).destroy
    redirect_to account_path
  end

  private

  def find_show
    @show = Show.find(params[:followed_show][:show_id])
  end

  def check_air_date(followed_show)
    followed_show.show.episodes.select { |episode| episode.airing_date >= Date.today }
  end
end
