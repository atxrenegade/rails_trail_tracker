class CreateTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :trails do |t|
      t.string :name
      t.string :difficulty_rating
	  t.string :description
	  t.string :start_point
	  t.string :end_point
	  t.string :length_of_hike, null: true
	  t.string :terrain
	  t.string :notes

      t.timestamps
    end
  end
end
