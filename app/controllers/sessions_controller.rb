class SessionsController < ApplicationController
	def new
		render :login
	end

	def create
		user = request.env['omniauth.auth']
		if !user.nil?
			@user = User.find_or_create_by(uid: auth['uid']) do |u|
				u.name = auth['info']['name']
				u.email = auth['info']['email']
			end
				session[:user_id] = @user.id
				redirect_to '/trails'
		else
			@user = User.find_by(name: params[:user][:name])
			if !@user || @user.nil?
				flash[:notice] = "Please enter a valid username"
				render :login
			elsif @user && @user.authenticate(params[:user][:password])
				session[:id] = @user[:id]
				redirect_to '/trails'
			else
				flash[:notice] = "Please enter the correct password"
				render :login
			end
		end
	end

	def destroy
		session.delete [:name]
		redirect_to '/login'
	end

	private
	def auth
		request.env['omniauth.auth']
	end
end
