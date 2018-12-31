class User < ApplicationRecord
	has_secure_password
	has_many :hikes
	has_many :trails, through: :users
end
