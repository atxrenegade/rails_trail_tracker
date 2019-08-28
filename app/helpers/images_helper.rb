module ImagesHelper
	def imageable_path
		type = @image.imageable_type.downcase + 's'
		type_id = @image.imageable_id
		return "/#{type}/#{type_id}"
	end

	def images_path
		return imageable_path + "/images"
	end

	def show_image_path
		return images_path + "/#{@image.id}"
	end

	def build_images_path(action_type)
		return show_image_path + "/#{action_type}"
	end

	def build_image_params(params)
		@image_params = {url: params["image"]["url"], date: params["image"]["date"], trail_name: @trail_name, username: current_user.name, is_public: params["image"]["is_public"], description: params["image"]["description"], hike_id: @hike_id, imageable_type: @image.imageable_type, imageable_id: @image.imageable_id}
	end

	def check_image_type
		if @image.imageable_type == "Hike"
			set_hike_variables
		elsif @image.imageable_type == "Trail"
			set_trail_variables
		else
			set_user_variables
		end
	end

	def set_hike_variables
		@trail_name = Trail.find_by_id(@imageable.trail_id).name
		@hike_id = @imageable.id
	end

	def set_trail_variables
		@trail_name = @imageable.name
		@hike_id = 0
	end

	def set_user_variables
		@trail_name = 'n/a'
		@hike_id = 0
	end

	#methods to refactor as class methods in model
	def profile_pic
		Image.find_by(username: current_user.name, imageable_type: "User")
	end

	def collect_user_images
		Image.where(username: current_user.name).where.not(imageable_type: "User")
	end

	def collect_user_hike_images
		Image.where(username: current_user.name).where(hike_id: @hike.id)
	end

	def collect_user_trail_images
		Image.where(trail_name: @trail.name).where(username: current_user.name)
	end

	def collect_public_trail_images
		Image.where(trail_name: @trail.name).where(is_public: true)
	end

	def collect_public_images
		Image.where(is_public: true).where.not(imageable_type: "User")
	end
end
