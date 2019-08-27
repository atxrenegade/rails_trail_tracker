class Hike < ApplicationRecord
	belongs_to :user
	belongs_to :trail
	has_many :images, as: :imageable

	validates :date_of_hike,
		format: { with: /[0-1]{1}[0-9]{1}\/[0-3]{1}[0-9]{1}\/\d{2}\z/, message: " - Please Enter Valid Date Format" },
		presence: true

	def self.delete_hike_images(hike)
		@images = Image.find_by(hike_id: hike.id)
		@images.destroy if @images.present?
	end
end
