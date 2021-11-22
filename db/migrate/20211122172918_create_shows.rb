class CreateShows < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.string :name
      t.text :summary
      t.integer :number_of_seasons

      t.timestamps
    end
  end
end
