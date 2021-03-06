class User < ApplicationRecord
	DEFAULT_PROFILE_PIC_URL = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"

	has_secure_password
	has_many :hikes
	has_many :trails, through: :hikes
	has_many :images, as: :imageable

	validates :name,
		presence: { message: "- cannot be blank"},
		uniqueness: { message: "This username has already been taken." }

	validates :email,
		format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,  message: "Enter a valid email address" },
		presence: true,
		uniqueness: { message: "This email address is already associated with an existing account. Please sign in." }

	validates :password,
		presence: true,
		confirmation: { message: "must match."}

	def self.create_with_omniauth(auth)
	  user = find_or_create_by(uid: auth['uid'])
	  if user.name != nil
	    user
	  else
			user.email = auth["info"]['email']
		  user.name = auth['info']['name']
			user.password = auth['uid']
	    user.save!
	    user
	  end
		@user = user
	end
end
