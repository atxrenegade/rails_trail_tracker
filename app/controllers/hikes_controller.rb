class HikesController < ApplicationController
	def index
		@hikes = Hike.all
	end

	def show
		@hike = Hike.find_by(id: params[:id])
	end

	def new
		@hike = Hike.new
	end

	def create
		@hike = Hike.create(hike_params)
		redirect_to @hike
	end

	def edit
		@hike = Hike.find_by(id: params[id])
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
