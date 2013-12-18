class Member::UsersController < Member::MembersController
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
		@member.update_attributes(user_profile_parameters)
		if @member.errors.any?
			render "edit"
		else
			flash[:notice] = "User successfully updated."
			redirect_to member_root_path
		end
	end

	def destroy
		@member = current_user
		@member.destroy
		redirect_to member_root_path
	end

	private
  	def user_profile_parameters
    	params.require(:user).permit(:name, :password, :password_confirmation, :email)
  	end
end
