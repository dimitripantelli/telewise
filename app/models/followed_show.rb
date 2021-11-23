class FollowedShow < ApplicationRecord
  belongs_to :user_id
  belongs_to :show_id
end
