class UsersController < ApplicationController
	def new
		@user = User.new
		render :sign_up
	end

	def create
		@user = User.find_or_create_by(user_params)
		if @user.save
			session[:id] = user[:id]
			redirect_to '/trails/index'
		else
			render :sign_up
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
