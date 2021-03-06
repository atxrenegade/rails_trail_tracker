class ImagesController < ApplicationController
	include ImagesHelper
	before_action :load_imageable, :except => [:gallery]

  def index
		@images = @imageable.images
  end

	def show
		@image = @imageable.images.find_by_id(params[:id])
	end

  def new
		@image = @imageable.images.new(params[:images])
		check_image_type
  end

  def create
		@image = @imageable.images.new(params[:images])
		check_image_type
		build_image_params(params)
		@image = Image.create(@image_params)
		if @image.save
			path = show_image_path
			redirect_to path, notice: "Image Saved!"
		else
			render :new, notice: "Image Save ERROR!"
		end
  end

  def edit
		if @image.nil?
			@image = @imageable.images.find_by_id(params[:id])
		end
		render :edit
  end

	def update
		@image = @imageable.images.find_by_id(params[:id])
		@image.update(image_params)
		path = show_image_path
		redirect_to path, notice: "Image Updated!"
	end

  def destroy
		@image = @imageable.images.find_by_id(params[:id])
		@image.destroy
		path = imageable_path
		redirect_to path, notice: "Image Deleted!"
  end

	def gallery
		if current_user
			render 'shared/_all_images'
		else
			require_user
		end
	end

	private
	def load_imageable
		resource, id = request.path.split('/')[1,2]
		@imageable = resource.singularize.classify.constantize.find(id)
		@image = profile_pic if resource == "users"
	end

	def image_params
		params.require(:image).permit(:url, :date, :is_public, :trail_name, :username, :description, :hike_id, :imageable_type, :imageable_id)
	end
end
