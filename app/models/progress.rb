class Progress < ApplicationRecord
  belongs_to :user_id
  belongs_to :episode_id
end
