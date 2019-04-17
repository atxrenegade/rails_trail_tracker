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
		@hike = Hike.create(hikes_params)
		redirect_to hike_path(@hike)
	end

	def edit
		@hike = Hike.find_by(id: params[id])
	end

	def update
	end

	private
	def hikes_params
		params.require(:hike).permit(:date_of_hike, :comments, :is_public, :trail_id, :user_id)
	end
end

#create nested resource routes for hikes under user show page
#implement join table for hikes user_id and hikes trail_id
#add drop down menu for trail id
