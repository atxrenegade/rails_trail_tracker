module TrailsHelper

		def handle_associated(params)
			@hikes = Hike.find_by(trail_id: params[:id])
			@images = Image.find_by(trail_name: @trail.name)
			if !@hikes.nil?
				@hikes = nil
				redirect_to @trail, notice: "Trails with associated hikes cannot be deleted!"
			else
				delete_trail
				redirect_to trails_path, notice: "Trail successfully deleted!"
			end
		end

		def delete_trail
			#calling second sql query to confirm the correct images will be deleted
			@images = Image.find_by(trail_name: @trail.name)
			@images.destroy if !@images.nil?
			@trail.destroy
		end
end
