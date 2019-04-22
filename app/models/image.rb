class Image < ApplicationRecord
	belongs_to :imageable, polymorphic: true

	def public_images
		Image.where(is_public: true)
	end

	validates :date,
		format: { with: /\d{2}\/\d{2}\/\d{2}/, message: " - Please Enter Valid Date Format" },
		presence: true

	validates :url,
		presence: true,
		format: { with: // , message: " - Please Enter a Valid Web Address" }

end
