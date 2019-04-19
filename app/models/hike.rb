class Hike < ApplicationRecord
	belongs_to :user
	belongs_to :trail
	has_many :images, as: :imageable

	validates :date_of_hike,
		format: { with: /\d{2}\/\d{2}\/\d{2}/, message: " - Please Enter Valid Date Format" },
		presence: true
end
