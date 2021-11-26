class Show < ApplicationRecord
  # searchkick word_start: ['name']

  validates :name, :summary, :number_of_seasons, presence: true
  has_many :episodes
  # has_one_attached :photo
end
