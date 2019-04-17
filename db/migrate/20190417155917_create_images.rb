class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
			t.string :date
			t.string :description
			t.boolean :is_public
			t.references :imageable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
