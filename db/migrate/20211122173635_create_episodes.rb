class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes do |t|
      t.references :show_id, null: false, foreign_key: true
      t.integer :season_number
      t.date :airing_date
      t.string :name
      t.integer :episode_number
      t.text :description

      t.timestamps
    end
  end
end
