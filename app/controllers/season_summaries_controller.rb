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
  end
end
