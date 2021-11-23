class CreateFollowedShows < ActiveRecord::Migration[6.0]
  def change
    create_table :followed_shows do |t|
      t.references :user, null: false, foreign_key: true
      t.references :show_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
