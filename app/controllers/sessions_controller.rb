class SessionsController < ApplicationController

	def create
		@user = User.find_by(name: params[:name])

		if !!@user && @user.authenticate(params[:password])
			cookies[:user_id] = @user.id
			redirect_to root_path
		else	
			message = "Something went wrong!"
			redirect_to login_path, notice: message
		end

	end

end