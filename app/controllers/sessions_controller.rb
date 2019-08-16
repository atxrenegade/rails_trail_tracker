class SessionsController < ApplicationController
	def new
		render :login
	end

	def create
		if request.env['omniauth.auth']
			user = User.create_with_omniauth(request.env['omniauth.auth'])
			session[:user_id] = user.id
			redirect_to trails_path
	  else
			@user = User.find_by(name: params[:user][:name])
			if !@user || @user.nil?
				flash.now[:notice] = "Please enter a valid username and password"
				render :login
			elsif @user && @user.authenticate(params[:user][:password])
				session[:user_id] = @user[:id]
				redirect_to '/welcome'
			else
				flash.now[:notice] = "Please enter a valid username and password"
				render :login
			end
		end
	end

	def welcome
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
