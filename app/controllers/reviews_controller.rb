class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @show = Show.find(params[:show_id])
    @review.show = @show
    @review.user = current_user
    if @review.save
      redirect_to show_path(@show)
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
