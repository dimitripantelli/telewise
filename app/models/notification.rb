class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :episode

  scope :unread, ->{ where(read_at: nil) }
end
