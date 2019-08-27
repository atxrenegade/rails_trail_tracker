module HikesHelper
	def build_hike_params(params)
	  params["hike"]["is_public"].to_i == 1 ? is_public = true : is_public = false
		#can this be simplified using an exisitng helper or method?

		@hike_params = {"date_of_hike": params["hike"]["date_of_hike"],
 		"trail_id": params["hike"]["trail_id"],
 		"comments": params["hike"]["comments"],
 		"is_public": is_public, "user_id": current_user.id}
	end

	def public_user(hike)
		#retrieves username for recent hikes
		 User.find_by(id: hike.user_id).name
	end
end
