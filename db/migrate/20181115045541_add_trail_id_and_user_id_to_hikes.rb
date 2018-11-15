class AddTrailIdAndUserIdToHikes < ActiveRecord::Migration[5.2]
  def change
    add_column :hikes, :trail_id, :integer
    add_column :hikes, :user_id, :integer
  end
end
