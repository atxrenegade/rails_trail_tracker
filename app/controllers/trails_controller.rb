class TrailsController < ApplicationController
	def show
		@trail = Trail.find_by(id: params[:id])
		render :show
	end

	def new
		
	end

	def create
		@trail = Trail.create(trail_params)
		redirect_to trail_path
	end

	private
	def trail_params
		params.require(:trail).permit(:name, :start_point, :end_point, :difficulty, :length_of_hike, :terrain, :notes)
	end
end
