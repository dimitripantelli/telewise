class SeasonSummariesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @show = Show.find(params[:show_id])
    @season = params[:season]
  end
end
