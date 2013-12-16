class UsersController < ApplicationController
	before_filter :check_admin, :only => [:destroy]

	def new
		@member = User.new
	end

	def create
		@member = User.create!(user_profile_parameters)
		login(@member)
		redirect_to user_home_path(@member)
	end

	def edit
		@member = User.find(params[:id])
	end

	def update
		@member.update_attributes(params[:user])
	end

	def destroy
		@member = User.find(params[:id])
		@member.destroy
	end

	def home
		@member = User.find(params[:user_id])
		@company = @member.company
		
	end

	def index
		@users = User.all
	end

	private
  	def user_profile_parameters
    	params.require(:user).permit(:name, :password, :password_confirmation, :email, :role)
  	end

end
