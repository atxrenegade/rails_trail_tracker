class Image < ApplicationRecord
	belongs_to :imageable, polymorphic: true

	validates :date,
		format: { with: /[0-1]{1}[0-9]{1}\/[0-3]{1}[0-9]{1}\/\d{2}\z/, message: " - Please Enter Valid Date Format" },
		presence: true

	validates :url,
		presence: true,
		format: { with: /https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,}/ , message: " - Please Enter a Valid Web Address" }

		def self.profile_pic
			Image.find_by(username: current_user.name, imageable_type: "User")
		end

		def self.collect_user_images
			Image.where(username: User.user_by_name).where.not(imageable_type: "User")
		end

		def self.collect_user_hike_images
			Image.where(username: current_user.name).where(hike_id: @hike.id)
		end

		def self.collect_user_trail_images
			Image.where(trail_name: @trail.name).where(username: current_user.name)
		end

		def self.collect_public_trail_images
			Image.where(trail_name: @trail.name).where(is_public: true)
		end

		def self.collect_public_images
			Image.where(is_public: true).where.not(imageable_type: "User")
		end
end
