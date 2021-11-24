class SeasonSummariesController < ApplicationController
  def index
    @show = Show.find(params[:show_id])
  end
end
