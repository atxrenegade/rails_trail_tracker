class CreateHikes < ActiveRecord::Migration[5.2]
  def change
    create_table :hikes do |t|
			t.belongs_to :user, index: true
      t.belongs_to :trail, index: true
      t.string :date_of_hike
      t.text :comments
			t.boolean :is_public
      t.timestamps
    end
  end
end
