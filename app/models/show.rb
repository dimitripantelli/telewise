class Show < ApplicationRecord
  validates :name, :summary, :number_of_seasons, presence: true
  has_many :episodes
end
