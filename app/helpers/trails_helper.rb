module TrailsHelper
	def check_associated(params)
		@hikes = Hikes.find_by(trail_id: params[:id])
		if (@hikes != nil)
			flash[:notice] = "Trails with associated hikes cannot be deleted!"
		end
		return @hikes
	end

	def handle_associated(params)
		@hikes = Hike.find_by(trail_id: params[:id])
		if !@hikes.nil?
			@hikes = nil #clearing the value of @hikes
			redirect_to @trail, notice: "Trails with associated hikes cannot be deleted!"
		else
			Trail.delete_trail_images(@trail)
			@trail.delete
			redirect_to trails_path, notice: "Trail successfully deleted!"
		end
	end
end
