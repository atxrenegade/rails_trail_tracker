class CreateHikes < ActiveRecord::Migration[5.2]
  def change
    create_table :hikes do |t|
      t.string :date_of_hike
      t.text :comments

      t.timestamps
    end
  end
end
