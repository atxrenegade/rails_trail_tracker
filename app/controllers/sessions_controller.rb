class SessionsController < ApplicationController
	def new
		@session = Session.new
		render :login
	end

	def create
		@session = Session.create
		redirect_to '/trails/index'
	end
end
