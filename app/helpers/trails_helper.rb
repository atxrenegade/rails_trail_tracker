module TrailsHelper

		def handle_associated(params)
			@hikes = Hike.find_by(hike_id: params[:id])
			@images = Image.find_by(trail_name: @trail.name)
			if !@hikes.nil?
				handle_trail_with_associated_hikes
			else
				delete_trail
			end
		end


		def handle_trail_with_associated_hikes
			return flash[:notice] = "Trails with associated hikes cannot be deleted!"
		end


		def delete_trail
			#calling second sql query to confirm the correct images will be deleted
			@images = Image.find_by(trail_name: @trail.name)
			@images.destroy if !@images.nil?
			@trail.destroy
		end
end
