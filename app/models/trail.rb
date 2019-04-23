class Trail < ApplicationRecord
	has_many :hikes
	has_many :users, through: :hikes
	has_many :images, as: :imageable

	validates :name,
		presence: { message: "cannot be blank"}

	validates :start_point,
		presence: { message: "cannot be blank"}

	validates :difficulty_rating,
		presence: true,
		format: { with: /[1-5]{1}/, message: " - Please Enter a Valid Number" }

end
