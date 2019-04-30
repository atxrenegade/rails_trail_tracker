module ImagesHelper
	def images_path
		type = @image.imageable_type.downcase + 's'
		type_id = @image.imageable_id
		return "/#{type}/#{type_id}/images"
	end

	def show_image_path
		return images_path + "/#{@image.id}"
	end

	def build_images_path(action_type)
		return show_image_path + "/#{action_type}"
	end

	def collect_user_images
		@images = Image.where(username: current_user.name)
	end

	def collect_user_hike_images
		binding.pry
		hike_id = @hike.id
		@images = Image.where(username: current_user.name).where(hike_id: hike_id)
	end

	def collect_user_trail_images
		trail_id = @trail.id
		@images = Image.where(trail_id: trail_id)
		@images = Image.where(username: current_user.name).or(Image.where(is_public: true))
	end

	def collect_public_images
		@images = Image.where(is_public: true)
	end
end
