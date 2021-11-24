class Show < ApplicationRecord
  validates :name, :summary, :number_of_seasons, presence: true
  has_many :episodes, dependent: :destroy
  has_many :season_summaries, dependent: :destroy
end
