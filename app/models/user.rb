class User < ApplicationRecord
	has_many :hikes
	has_many :trails, through: :users
end
