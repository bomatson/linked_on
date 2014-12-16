class SessionsController < ApplicationController
	before_action :authorize, only: [:destroy]
	
	def new

	end

	def create
		@user = User.find_by_email(params[:email])

		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
				# new kind of hash! like params hash and flash hash
			redirect_to root_path, notice: "You're logged in"
		else
			redirect_to '/login', notice: "You're not logged in"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/login', notice: "You're logged out"
	end
end
