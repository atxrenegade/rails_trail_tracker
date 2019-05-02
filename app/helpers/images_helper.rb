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

	def build_image_params(params)
		username = current_user.name
		image_params = {url: params["image"]["url"], date: params["image"]["date"], trail_name: @trail_name, username: username, is_public: params["image"]["is_public"], description: params["image"]["description"], hike_id: hike_id, imageable_type: @image.imageable_type, imageable_id: @image.imageable_id}
		return image_params
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

	def profile_pic
		@profile_pic = Image.find_by(username: current_user.name, imageable_type: "User")
	end

	def collect_user_images
		@images = Image.where(username: current_user.name).where.not(imageable_type: "User")
	end

	def collect_user_hike_images
		hike_id = @hike.id
		@images = Image.where(username: current_user.name).where(hike_id: hike_id)
	end

	def collect_user_trail_images
		trail_name = @trail.name
		@images = Image.where(trail_name: trail_name).where(username: current_user.name)
	end

	def collect_public_trail_images
		trail_name = @trail.name
		@images = Image.where(trail_name: trail_name).where(is_public: true)
	end

	def collect_public_images
		@images = Image.where(is_public: true).where.not(imageable_type: "User")
	end

	def set_hike_variables
		#refactor into activerecord query statements
		@hike = Hike.all.find_by_id(params["hike_id"])
		@trail_name = Trail.all.find_by_id(@hike.trail_id).name
	end

	def set_trail_variables
		#refactor into activerecord query statements
		@trail_name = Trail.all.find_by_id(@image.imageable_id).name
	end

	def set_user_variables
		@trail_name = 'n/a'
	end
end
