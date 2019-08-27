module HikesHelper
	def build_hike_params(params)
	  params["hike"]["is_public"].to_i == 1 ? is_public = true : is_public = false
		@hike_params = {"date_of_hike": params["hike"]["date_of_hike"],
 		"trail_id": params["hike"]["trail_id"],
 		"comments": params["hike"]["comments"],
 		"is_public": is_public, "user_id": current_user.id}
	end
end
