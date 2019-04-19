class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :url
      t.string :date
      t.string :description
      t.boolean :is_public
      t.string :username
			t.string :trail_name
			t.timestamps
			t.belongs_to :imageable, polymorphic:true
    end
		add_index :images, [:imageable_id, :imageable_type]
  end
end
