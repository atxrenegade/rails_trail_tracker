class User < ApplicationRecord
	has_secure_password
	has_many :hikes
	has_many :trails, through: :hikes

	validates :name, presence: true, message: "Username cannot be blank"
	validates :name, uniqueness: true, message: "This username has already been taken."
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: "Enter a valid email address" }
	validates :email, uniqueness: true, message: "This email address is already associated with an existing account. Please sign in."
	validates :password, presence: true, message: "Password cannot be empty"
	validates :password,  confirmation: true, message: "Passwords must match."
end
