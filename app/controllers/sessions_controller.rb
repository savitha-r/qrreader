class SessionsController < ApplicationController
	before_filter :signed_in_user, :except => [:sign_in]

	def sign_in
		@member = User.find_by_email(params[:email])
		if @member.authenticate(params[:password])
			login(@member)
			redirect_to member_root_path
		else
			redirect_to root_path
		end
	end

	def sign_out
		logout
		redirect_to root_path
	end


end
