class Image < ApplicationRecord
	belongs_to :imageable, polymorphic: true

	validates :date,
		format: { with: /[0-1]{1}[0-9]{1}\/[0-3]{1}[0-9]{1}\/\d{2}\z/, message: " - Please Enter Valid Date Format" },
		presence: true

	validates :url,
		presence: true,
		format: { with: /https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,}/ , message: " - Please Enter a Valid Web Address" }

		def self.collect_public_images
			Image.where(is_public: true).where.not(imageable_type: "User")
		end

		def self.collect_public_trail_images(trail_name)
			Image.where(trail_name: trail_name).where(is_public: true)
		end

		def self.collect_user_hike_images(username, hike_id)
			Image.where(username: username).where(hike_id: hike_id)
		end

		def self.collect_user_images(username)
			Image.where(username: username).where.not(imageable_type: "User")
		end

		def self.collect_user_trail_images(trail_name, username)
			Image.where(trail_name: trail_name).where(username: username)
		end

		def self.profile_pic(username)
			Image.find_by(username: username, imageable_type: "User")
		end
end
