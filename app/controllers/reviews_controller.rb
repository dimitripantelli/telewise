class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @show = Show.find(params[:show_id])
    @streaming = {}
    JSON.parse(@show.streaming.gsub('=>', ':')).each do |service|
      @streaming[service.keys[0]] = service.values[0].values[0].values[0]
    end
    @followed_show = FollowedShow.new
    @user = current_user
    @reviews = Review.where(show: @show)

    @review = Review.new(review_params)
    @review.show = @show
    @review.user = current_user
    if @review.save
      redirect_to show_path(@show)
    else
      render "shows/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
