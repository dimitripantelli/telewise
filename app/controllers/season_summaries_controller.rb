class SeasonSummariesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @show = Show.find(params[:show_id])
    @season = params[:season]
    if params[:update_notification]
      notification = Notification.find(params[:update_notification])
      notification.read_at = DateTime.now
      notification.save
    end
    progress =
      Progress
      .where(user: current_user)
      .select do |prog|
        prog.episode.show == @show &&
          prog.episode.season_number == @season.to_i
      end
      .last
    if progress.nil?
      @progress = -1
    else
      @progress = progress.episode.episode_number
    end
    @percentage =
      (
        100 *
          [0, @progress].max.fdiv(
            @show.episodes.where(season_number: @season.to_i).count
          )
      ).round
  end
end
