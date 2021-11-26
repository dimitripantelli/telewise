class AddRatingToShows < ActiveRecord::Migration[6.0]
  def change
    add_column :shows, :rating, :float
  end
end
