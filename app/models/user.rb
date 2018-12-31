class User < ApplicationRecord
	has_secure_password
	has_many :hikes
	has_many :trails, through: :hikes

	validates :name,
		presence: { message: "Username cannot be blank"},
		uniqueness: { message: "This username has already been taken." }

	validates :email,
		format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,  message: "Enter a valid email address" },
		presence: { message: "Email address cannot be blank"},
		uniqueness: { message: "This email address is already associated with an existing account. Please sign in." }


	validates :password,
		presence: { message: "Email address cannot be blank"},
		uniqueness: { message: "This email address is already associated with an existing account. Please sign in." },
		confirmation: { message: "Passwords must match."}

end
