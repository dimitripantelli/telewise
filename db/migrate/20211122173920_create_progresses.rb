class CreateProgresses < ActiveRecord::Migration[6.0]
  def change
    create_table :progresses do |t|
      t.references :user_id, null: false, foreign_key: true
      t.references :episode_id, null: false, foreign_key: true
      t.boolean :watched
      t.float :rating

      t.timestamps
    end
  end
end
