class HikesController < ApplicationController
	def index
		@trails = Trail.all
	end

	def show
		@trail = Trail.find_by(id: params[:id])
	end

	def new
		@trail = Trail.new
	end

	def create
		@hike = Hike.create(hike_params)
		redirect_to @hike
	end

	def edit
		@trail = Trail.find_by(id: params[id])
	end

	def update
	end

	private
	def trails_params
		params.require(:hike).permit(:date, :comments, :trail_id)
	end
end

#create nested resource routes for hikes under user show page
#implement join table for hikes user_id and hikes trail_id
#add drop down menu for trail id
