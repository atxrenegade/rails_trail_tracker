class User < ApplicationRecord
	has_secure_password
	has_many :hikes
	has_many :trails, through: :hikes

	validates :name,
		presence: { message: "cannot be blank"},
		uniqueness: { message: "This username has already been taken." }

	validates :email,
		format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,  message: "Enter a valid email address" },
		presence: true,
		uniqueness: { message: "This email address is already associated with an existing account. Please sign in." }

	validates :password,
		presence: true,
		confirmation: { message: "must match."}

		def self.create_with_omniauth(auth)
			binding.pry
		  user = find_or_create_by(uid: auth['uid'])
		  user.email = auth['email']
		  user.password = auth['uid']
		  user.name = auth['info']['name']

		  if User.exists?(user)
		    user
		  else
		    user.save!
		    user
		  end
		end
end
