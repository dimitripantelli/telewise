class Review < ApplicationRecord
  validates :rating, :content, presence: true
  belongs_to :user
  belongs_to :show
end
