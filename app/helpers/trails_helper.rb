module TrailsHelper

		def check_associated(params)
			@hikes = Hike.find_by(trail_id: params[:id])
			@images = Image.find_by(trail_name: @trail.name)
			@hikes.nil? && @images.nil? ?  false : true
		end

		def handle_associated
			if associated == "false"
				delete_trail
			elsif (!@hikes.nil?)
				return flash[:notice] = "Trails with associated hikes cannot be deleted!"
			else
				handle_associated_images
			end
		end

		def handle_associated_images
			flash[:notice] = "Deleting this trail will also delete related images. Would you like to proceed?"
			binding.pry
			if (response == true?)
				delete_images
			end
		end

		def delete_trail
			@trail.destroy
		end

		def delete_images
			@images.destroy
		end

		def delete_hike
			@hike.destroy
		end
end
