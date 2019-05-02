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

	def check_associated(params)
		@images = Image.find_by()
		if (@images != nil)
			flash[:notice] = "Deleting this hike will also delete associated images!"
		end
		return false
	end

	def delete_images_of_trail
		#implement functionality to delete all related trail images_path when trail is deleted
	end

	def collect_recent_hikes
		@recent_hikes = Hike.where(is_public: true).last(5)
	end
end
