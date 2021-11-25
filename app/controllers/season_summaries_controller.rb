class SeasonSummariesController < ApplicationController
  def index
    @show = Show.find(params[:show_id])
    @season = params[:season]
  end
end
