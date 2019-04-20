class Image < ApplicationRecord
	belongs_to :imageable, polymorphic: true

	def public_images
		Image.where(is_public: true)
	end
end
