module UsersHelper
	def default_profile_pic_URL
		#default profile picture
		"http://cmhipocrates.com/assets/img/default-profile-picture.jpg"
	end

	def set_image
		@image = @profile_pic
	end	
end
