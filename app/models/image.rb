class Image < ApplicationRecord
	belongs_to :imageable, polymorphic: true

	validates :date,
		format: { with: /[0-1]{1}[0-9]{1}\/[0-3]{1}[0-9]{1}\/\d{2}\z/, message: " - Please Enter Valid Date Format" },
		presence: true

	validates :url,
		presence: true,
		format: { with: /https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,}/ , message: " - Please Enter a Valid Web Address" }
end
