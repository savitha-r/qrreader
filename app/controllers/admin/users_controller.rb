class Admin::UsersController < Admin::AdminsController

	def new
		@member = User.new
	end

	def create
		@member = User.create(user_profile_parameters)
		if @member.errors.any?
			render "new"
		else
			flash[:notice] = "User successfully created."
			redirect_to admin_root_path
		end
	end

	def edit
		@member = get_entity User.find_by_id(params[:id])
	end

	def update
		@member = get_entity User.find_by_id(params[:id])
		@member.update_attributes(user_profile_parameters)
		if @member.save
			flash[:notice] = "User successfully updated."
			redirect_to admin_root_path
		else
			render "edit"
		end
	end

	def destroy
		@member = get_entity User.find_by_id(params[:id])
		@member.destroy
		redirect_to admin_root_path
	end

	def home
		@user = get_entity User.find_by_id(params[:user_id])
	end

	private
  	def user_profile_parameters
    	params.require(:user).permit(:name, :password, :password_confirmation, :email)
  	end
	
end


