class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :recipient_id
      t.datetime :read_at
    end
  end
end
