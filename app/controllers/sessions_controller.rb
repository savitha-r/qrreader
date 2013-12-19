class SessionsController < ApplicationController
	before_filter :signed_in_user, :except => [:sign_in]

	def sign_in
		@member = get_entity User.find_by_email(params[:email])
		if @member.authenticate(params[:password])
			login(@member)
			if current_user.is_super_admin?
				redirect_to admin_root_path
			else
				redirect_to member_root_path				
			end
		else
			redirect_to root_path
		end
	end

	def sign_out
		logout
		redirect_to root_path
	end


end
