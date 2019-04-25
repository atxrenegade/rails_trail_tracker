module TrailsHelper
		def check_associated(params)
			@hikes = Hike.find_by(trail_id: params[:id])
			if (@hikes != nil)
				flash[:notice] = "Trails with associated hikes cannot be deleted!"
			end
			return false
		end
end
