class UsersController < ApplicationController
	def new
		@user = User.new
		render :sign_up
	end

	def create
		@user = User.create(user_params)
		redirect_to '/trails/index'
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password)
	end	
end
