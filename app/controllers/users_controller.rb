class UsersController < ApplicationController
  	def show
		@user = User.find_by(id: params[:id])
	end

	def new
		@user = User.new
		render :sign_up
	end

	def create
		@user = User.create(user_params)
		if @user.save
			session[:id] = @user[:id]
			redirect_to '/trails'
		else
			render :sign_up
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
