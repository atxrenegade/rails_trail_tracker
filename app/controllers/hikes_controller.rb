class HikesController < ApplicationController
	before_action :require_user
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
		user = current_user.id
	  params["is_public"] == 1 ? is_public = true : is_public = false
		hike_params = {"date_of_hike": params["hike"]["date_of_hike"],
 		"trail_id": params["hike"]["trail_id"],
 		"comments": params["hike"]["comments"],
 		"is_public": is_public, "user_id": user}
		@hike = Hike.create(hike_params)
		redirect_to hike_path(@hike)
	end

	def edit
		@hike = Hike.find_by(id: params[:id])
		render :edit
	end

	def update
		@hike = Hike.find_by(id: params[:id])
		@hike.update(hike_params)
		redirect_to hike_path(@hike)
	end

	private
	def hike_params
		params.require(:hike).permit(:date_of_hike, :comments, :is_public, :trail_id, :user_id)
	end
end

#create nested resource routes for hikes under user show page
#implement join table for hikes user_id and hikes trail_id
#add drop down menu for trail id
