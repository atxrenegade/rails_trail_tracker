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
		return show_image_path + "#{action_type}"
	end

	def check_type
		if @image.imageable_type == "Hike"
			set_hike_variables
		elsif @image.imageable_type == "Trail"
			set_hike_variables
		else
			set_user_variables
		end
	end

	def collect_user_images
		@images = Image.where(username: current_user.name)
	end

	def collect_user_hike_images
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

	def set_hike_variables
		@hike = Hike.all.find_by_id(params["hike_id"])
		@trail_name = Trail.all.find_by_id(@hike.trail_id).name
	end

	def set_trail_variables
		@trail_name = Trail.all.find_by_id(@image.imageable_id).name
	end

	def set_user_variables
		@trail_name = 'n/a'
	end
end
