class SessionsController < ApplicationController
	def new
		render :login
	end

	def create
		user = User.find_by(name: params[:user][:name])
		if !user || user.nil?
			flash[:notice] = "Please enter a valid username"
			render :login
		elsif user && user.authenticate(params[:user][:password])
			session[:user_id] = user[:id]
			@user = user #why is this line not setting my @user to be accessible throughout the program?
			redirect_to '/trails'
		else
			flash[:notice] = "Please enter the correct password"
			render :login
		end
	end

	def destroy
		session.delete [:user_id]
		redirect_to '/login'
	end

	private
	def auth
		request.env['omniauth.auth']
	end
end
