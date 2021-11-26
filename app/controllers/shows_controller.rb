class ShowsController < ApplicationController
  before_action :find_show, only: %i[show]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present?
      # Show.reindex
      # @shows = Show.search(params[:query], fields: [:name], match: :word_start)
      sql_query = "name ILIKE :query OR summary ILIKE :query"
      @shows = Show.where(sql_query, query: "%#{params[:query]}%")
    else
      @shows = Show.all
    end
  end

  # def autocomplete
  #   render json: Show.search(params[:query], {
  #     fields: ["name^5"],
  #     match: :word_start,
  #     limit: 10,
  #     load: false,
  #     misspellings: {below: 5}
  #   }).map(&:name)
  # end

  def show
    @streaming = {}
    JSON.parse(@show.streaming.gsub('=>', ':')).each do |service|
      @streaming[service.keys[0]] = service.values[0].values[0].values[0]
    end
    @streaming
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
    params.require(:show).permit(:name, :summary, :number_of_seasons, :rating, :photo)
  end

  def find_show
    @show = Show.find(params[:id])
  end
end
