class ShowsController < ApplicationController
  before_action :find_show, only: %i[show]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR summary ILIKE :query"
      @shows = Show.where(sql_query, query: "%#{params[:query]}%")
    else
      @shows = Show.all
    end
  end

  def show
  end

  # def new

  # end

  # def create

  # end

  # def edit
  # end

  # def update
  #   # @show = Show.find(params[:id])
  #   # if @show.update(show_params)
  #   #   redirect_to show_path(@show)
  #   # else
  #   #   render :edit
  #   # end
  # end

  # def destroy
    # @show = Show.find(params[:id])
    # redirect_to show_path
  # end

  # def details
  #   # @show = Show.find(params[:id])
  # end

  private

  def show_params
    params.require(:show).permit(:name, :summary, :number_of_seasons, :photo)
  end

  def find_show
    @show = Show.find(params[:id])
  end
end
