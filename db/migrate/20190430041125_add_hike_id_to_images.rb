class AddHikeIdToImages < ActiveRecord::Migration[5.2]
	def change
	  add_column :images, :hike_id, :integer, default: 0
  end
end
