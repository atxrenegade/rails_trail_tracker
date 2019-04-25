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
		#type should be edit, update, or delete
		return show_image_path + "/#{action_type}"
	end


	def collect_user_images
		@images = Image.all.where(username: current_user.name)
	end

	def collect_public_images
		@images = Image.all.where(is_public: true)
	end
end
