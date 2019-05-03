module TrailsHelper
	
		def check_associated(params)
			@hikes = Hike.find_by(trail_id: params[:id])
			@images = Image.find_by(trail_id: params[:id])
			if (@hikes.empty? && @images.empty?) ?  false : true
		end

		def handle_associated_hikes
			if (@hikes != nil)
				return flash[:notice] = "Trails with associated hikes cannot be deleted!"
			elsif
				@images = Image.find_by(trail_id: params[:id])
				return flash[:notice] = "Deleting this trail will also delete related images. Would you like to proceed?"
			else
				return false
			end
		end

		def handle_associated_images
			return flash[:notice] = "Deleting this trail will also delete related images. Would you like to proceed?"
			if response == true?
				delete_images_of_trail
			end
		end

		def delete_trail
			@trail.destroy
		end

		def delete_images_of_trail
			@images.destroy
		end
end
