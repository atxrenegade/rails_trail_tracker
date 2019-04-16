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
				flash[:notice] = "Please enter a valid username"
				render :login
			elsif @user && @user.authenticate(params[:user][:password])
				session[:user_id] = @user[:id]
				redirect_to '/trails'
			else
				flash[:notice] = "Please enter the correct password"
				render :login
			end
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
