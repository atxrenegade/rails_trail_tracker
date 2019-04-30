class HikesController < ApplicationController
	include HikesHelper
	extend HikesHelper

	before_action :require_user

	def index
		@hikes = Hike.all.where(user_id: current_user.id)
		@public_hikes = Hike.all.where(is_public: true)
	end

	def show
		@hike = Hike.find_by(id: params[:id])
		@imageable = @hike
		@images = @imageable.images
		@image = Image.new
	end

	def new
		@hike = Hike.new
	end

	def create
		user = current_user.id
	  params["is_public"] == 1 ? is_public = true : is_public = false
		#can this be simplified using an exisitng helper or method?

		hike_params = {"date_of_hike": params["hike"]["date_of_hike"],
 		"trail_id": params["hike"]["trail_id"],
 		"comments": params["hike"]["comments"],
 		"is_public": is_public, "user_id": user}

		@hike = Hike.create(hike_params)
		if @hike.save
			redirect_to hike_path(@hike)
		else
			render :new
		end
	end

	def edit
		@hike = Hike.find_by(id: params[:id])
		render :edit
	end

	def update
		@hike = Hike.find_by(id: params[:id])
		@hike.update(hike_params)
		if @hike.save
			redirect_to hike_path(@hike)
		else
			render :edit
		end
	end

	def destroy
		@hike = Hike.find_by(id: params[:id])
		@hike.destroy
		redirect_to hikes_path
	end

	private
	def hike_params
		params.require(:hike).permit(:date_of_hike, :comments, :is_public, :trail_id, :user_id)
	end
end
