class FollowedShowsController < ApplicationController
  before_action :find_show, only: [:new, :create]

  def new
    @followed_show = FollowedShow.new
  end

  def create
    @followed_show = FollowedShow.new
    @followed_show.show = @show
    @followed_show.user = current_user
    if @followed_show.save
      # show message saying you've added
    end
  end

  def destroy
    FollowedShow.destroy(params[:id])
    redirect_to account_path
  end

  private

  def find_show
    @show = Show.find(params[:followed_show][:show_id])
  end
end
