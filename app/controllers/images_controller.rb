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
end
