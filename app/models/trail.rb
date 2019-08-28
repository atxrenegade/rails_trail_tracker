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
		format: { with: /\A[1-5]\z/, message: " - Please Enter a Valid Number" }

		def self.delete_trail_images(trail)
			@images = Image.find_by(trail_name: trail.name)
			@images.destroy if !@images.nil?
		end
end
