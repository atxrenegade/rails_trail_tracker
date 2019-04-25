module TrailsHelper
		def check_associated(params)
			@hikes = Hike.find_by(trail_id: params[:id])
			if (@hikes != nil)
				flash[:notice] = "Trails with associated hikes cannot be deleted!"
			end
			return false
		end

		def delete_images_of_trail
			#implement functionality to delete all related trail images_path when trail is deleted
		end
end
