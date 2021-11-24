class UserController < ApplicationController
  def show
    @user = current_user
    @followed_shows = @user.followed_shows
    @progresses = Progress.all
    @my_progresses = @progresses.where(user_id: @user.id)
  end
end
