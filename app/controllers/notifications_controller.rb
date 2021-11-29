class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @notifications = Notification.where(user: current_user).unread
    @followed_shows = @user.followed_shows
    @followed_shows.each do |show|
      p show.show.episodes
    end
    Notification.create(recipient_id: @user)
  end

  def mark_as_read
    @notifications = Notification.where(user: current_user).unread
    @notification.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end
end
