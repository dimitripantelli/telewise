class AddEpisodeIdToNotifications < ActiveRecord::Migration[6.0]
  def change
    remove_column :notifications, :recipient_id, :integer
    remove_column :notifications, :notifiable_id, :integer
    remove_column :notifications, :notifiable_type, :string
    add_reference :notifications, :episode, foreign_key: true
    add_reference :notifications, :user, foreign_key: true
  end
end
