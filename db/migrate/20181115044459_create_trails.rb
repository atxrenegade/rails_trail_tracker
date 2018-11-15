class CreateTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :trails do |t|
      t.string :name
      t.string :description
      t.string :location
      t.string :difficulty_rating

      t.timestamps
    end
  end
end
