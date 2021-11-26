class SeasonSummary < ApplicationRecord
  belongs_to :show
  validates :season_number, presence: true
end
