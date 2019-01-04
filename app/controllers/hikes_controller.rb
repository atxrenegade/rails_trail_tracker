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

	end

	def edit
		@trail = Trail.find_by(id: params[id])
	end

	def update
	end

	private
	def trails_params

	end
end
