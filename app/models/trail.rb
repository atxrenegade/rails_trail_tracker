class Trail < ApplicationRecord
	has_many :hikes
	has_many :users, through: :hikes
	has_many :pictures, as: :imageable
end
