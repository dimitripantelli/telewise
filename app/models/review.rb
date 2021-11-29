class Review < ApplicationRecord
  validates :rating, :content, presence: true
  belongs_to :user
  belongs_to :show
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
end
