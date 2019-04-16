class UsersController < ApplicationController
	before_action :require_user, only: [:show]

  	def show
		@user = User.find_by(id: params[:id])
	end

	def new
		@user = User.new
		render :signup
	end

	def create
		@user = User.create(user_params)
		if @user.save
			session[:id] = @user[:id]
			redirect_to '/trails'
		else
			render :signup
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
