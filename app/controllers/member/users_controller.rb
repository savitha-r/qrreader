class Member::UsersController < ApplicationController
	before_filter :signed_in_user, :except => [:new, :create]


	def new
		@member = User.new
	end

	def create
			@member = User.create(user_profile_parameters)
			if @member.errors.any?
				render "new"
			else
				flash[:notice] = "User successfully created. Please sign in."
				redirect_to root_path
			end
	end

	def edit
		@member = current_user
	end

	def update
		@member = current_user
		@member.update_attributes(params[:user])
	end

	def destroy
		@member = current_user
		@member.destroy
	end

	private
  	def user_profile_parameters
    	params.require(:user).permit(:name, :password, :password_confirmation, :email)
  	end
end
