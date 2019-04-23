class TrailsController < ApplicationController
	before_action :require_user, only: [:show, :new, :edit]

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
		@trail = Trail.create(trail_params)
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
		redirect_to trail_path(@trail)
	end

	def destroy
		@trail = Trail.find_by(id: params[:id])
		#@trail.check_associated(params)
		#if @hikes == nil
		@trail.destroy
		redirect_to trails_path
		#else
			#redirect_to trail_path(@trail)
		#end
	end

	private
	def trail_params
		params.require(:trail).permit(:name, :start_point, :end_point, :difficulty_rating, :length_of_hike, :terrain, :description, :notes)
	end
end
