class TrailsController < ApplicationController
	include TrailsHelper
	before_action :require_user, only: [:show, :index, :new, :edit]

	def index
		@trails = Trail.all
	end

	def show
		@trail = Trail.find_by(id: params[:id])
		@imageable = @trail
		@images = @imageable.images
		@image = Image.new
	end

	def new
		@trail = Trail.new
	end

	def create
		@trail = Trail.new(trail_params)
		if @trail.save
			redirect_to trail_path(@trail)
		else
			render :new
		end
	end

	def edit
		@trail = Trail.find_by(id: params[:id])
		render :edit
	end

	def update
		@trail = Trail.find_by(id: params[:id])
		@trail.update(trail_params)
		if @trail.save
			redirect_to trail_path(@trail)
		else
			render :edit
		end
	end

	def destroy
		@trail = Trail.find_by(id: params[:id])
		handle_associated(params)
	end

	private
	def trail_params
		params.require(:trail).permit(:name, :start_point, :end_point, :difficulty_rating, :length_of_hike, :terrain, :description, :notes)
	end
end
