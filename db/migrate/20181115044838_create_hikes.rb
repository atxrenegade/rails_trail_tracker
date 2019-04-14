class CreateHikes < ActiveRecord::Migration[5.2]
  def change
    create_table :hikes do |t|
      t.string :date_of_hike
      t.text :comments
	  	t.integer :user_id
	  	t.integer :trail_id
      t.timestamps
    end
  end
end
