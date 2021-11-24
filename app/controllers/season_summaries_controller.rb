class SeasonSummariesController < ApplicationController
  def index
    @show = show.find(params[:show_id])
  end
end
