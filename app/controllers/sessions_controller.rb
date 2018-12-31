class SessionsController < ApplicationController
	def new
		render :login
	end

	def create
		#validate username and login, authenticate, set session hash
		binding.pry
		#debug login and validation
		@user = User.find_by(params[:user][:name])
		if !@user || @user.nil?
			return render :login
		elsif @user && @user.autheticate(params[:user][:password])
			session[:id] = @user[:id]
			return redirect_to '/trails/index'
		else
			return render :login
		end
	end

	def destroy
		session.delete [:name]
		redirect_to '/login'
	end
end
