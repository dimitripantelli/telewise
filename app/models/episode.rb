class Episode < ApplicationRecord
  belongs_to :show
  has_many :progresses, dependent: :destroy
  has_many :notifications
end
