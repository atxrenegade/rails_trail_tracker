class Trail < ApplicationRecord
	has_many :hikes
	has_many :users, through: :hikes
	has_many :images, as: :imageable

	validates :name,
 		presence: { message: " - cannot be blank"},
 		uniqueness: { message: " - This trail already exists." }

	validates :start_point,
		presence: { message: "- cannot be blank"}

	validates :difficulty_rating,
		presence: true,
		format: { with: /[1-5]{1}/, message: " - Please Enter a Valid Number" }

	def check_associated(params)
		@hikes = Hikes.find_by(trail_id: params[:id])
		if (@hikes != nil)
			flash[:notice] = "Trails with associated hikes cannot be deleted!"
		end
		return @hikes
	end
end
