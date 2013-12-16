class Member::UsersController < ApplicationController

	def sign_up
		@member = User.new
	end

	def sign_in
		@member = User.find_by_email(params[:email])
		login(@member)
	end

	def sign_out
		logout(current_user)
	end


	

end
