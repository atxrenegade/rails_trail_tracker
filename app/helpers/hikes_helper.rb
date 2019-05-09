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
		#retrieves username for recent hikes
		 User.find_by(id: hike.user_id).name
	end

	def delete_hike_and_images
		#calling second sql query to confirm the correct images will be deleted
		@images = Image.find_by(hike_id: @hike.id)
		@images.destroy if !@images.nil?
		@hike.destroy
	end

	def collect_recent_hikes
		@recent_hikes = Hike.where(is_public: true).last(5)
	end
end
