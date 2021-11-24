class CreateSeasonSummaries < ActiveRecord::Migration[6.0]
  def change
    create_table :season_summaries do |t|
      t.references :show, null: false, foreign_key: true
      t.integer :season_number
      t.text :summary

      t.timestamps
    end
  end
end
