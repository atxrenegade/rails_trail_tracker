class Hike < ApplicationRecord
	belongs_to :user
	belongs_to :trail
	has_many :pictures, as: :imageable
end
