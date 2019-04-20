class ImagesController < ApplicationController
	before_action :load_imageable

  def index
		@images = @imageable.images
  end

  def new
		@image = @imageable.images.new(params[:images])
  end

  def create
		@image = @imageable.images.new(params[:images])
		if @image.imageable_type == "Hike"
			@hike = Hike.all.find_by_id(params["hike_id"])
			@trail_name = Trail.all.find_by_id(@hike.trail_id).name
		elsif @image.imageable_type == "Trail"
			@trail_name = Trail.all.find_by_id(@image.imageable_id).name
		else
			@trail_name = 'n/a'
		end

		username = current_user.name
		image_params = {url: params["image"]["url"], date: params["image"]["date"], trail_name: @trail_name, username: username, is_public: params["image"]["is_public"], description: params["image"]["description"], imageable_type: @image.imageable_type, imageable_id: @image.imageable_id}
		@image = Image.create(image_params)
		if @image.save
			redirect_to [@imageable,:images], notice: "Image Saved!"
		else
			render :new
		end
  end

  def show
  end

  def edit
  end

	def update
	end

  def delete
  end

	private
	def load_imageable
		resource, id = request.path.split('/')[1,2]
		@imageable = resource.singularize.classify.constantize.find(id)
	end

	def image_params
		params.require(:user).permit(:url, :date, :is_public, :trail_name, :username, :description, :imageable_type, :imageable_id)
	end
end