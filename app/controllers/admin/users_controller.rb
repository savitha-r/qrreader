class Admin::UsersController < ApplicationController

	def sign_up
		@member = User.new
	end

	def create
		@member.update_attributes(params[:member])
	end

	def edit
		@member = User.find(params[:id])
	end

	def update
		@member.update_attributes(params[:member])
	end

	def destroy
		@member = User.find(params[:id])
		@member.destroy
	end

	def sign_in
		@member = User.find_by_email(params[:email])
		@member.authenticate
		login(@member)
	end

	def sign_out
		logout(current_user)
	end

	def index
		@users = User.all
	end

end
