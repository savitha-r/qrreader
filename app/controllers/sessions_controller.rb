class SessionsController < ApplicationController

	def sign_in
		@member = User.find_by_email(params[:email])
		if @member.authenticate(params[:password])
			login(@member)
			redirect_to user_home_path(@member)
		else
			redirect_to root_path
		end
	end

	def sign_out
		logout
		redirect_to root_path
	end


end
