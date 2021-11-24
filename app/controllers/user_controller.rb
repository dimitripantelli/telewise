class UserController < ApplicationController
  def show
    @user = current_user
    @followed_shows = @user.followed_shows
  end
end
