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
			@user = user
			redirect_to '/trails'
		else
			flash[:notice] = "Please enter the correct password"
			render :login
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end

	private
	def auth
		request.env['omniauth.auth']
	end
end
