module HikesHelper
	def build_hike_params(params)
		user = current_user.id
	  params["is_public"] == 1 ? is_public = true : is_public = false
		#can this be simplified using an exisitng helper or method?

		@hike_params = {"date_of_hike": params["hike"]["date_of_hike"],
 		"trail_id": params["hike"]["trail_id"],
 		"comments": params["hike"]["comments"],
 		"is_public": is_public, "user_id": user}
	end

	def public_user(hike)
		 User.find_by(id: hike.user_id).name
	end

	def check_associated
		@images = Image.where(hike_id: @hike.id)

	end

	def delete_associated_images
		@images.destroy
		flash[:notice] = "Hike and Images Deleted!"
	end

	def collect_recent_hikes
		@recent_hikes = Hike.where(is_public: true).last(5)
	end
end
