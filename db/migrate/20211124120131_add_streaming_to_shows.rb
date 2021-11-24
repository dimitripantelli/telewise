class AddStreamingToShows < ActiveRecord::Migration[6.0]
  def change
    add_column :shows, :streaming, :string
  end
end
