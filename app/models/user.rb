class User < ApplicationRecord
	has_secure_password
	has_many :hikes
	has_many :trails, through: :hikes

	validates :name, presence: true
	validates :name, uniqueness: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :password, presence: true
	validates :password, uniqueness: true
	validates :password, confirmation: true
end
