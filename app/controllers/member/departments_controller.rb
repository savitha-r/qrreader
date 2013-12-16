class Member::DepartmentsController < ApplicationController
	before_filter :signed_in_artist

	def new
		@department = Department.new
	end

	def create
		@department.update_attributes(params(:department))
	end

	def edit
		@department = Department.find(params[:id])
	end

	def update
		@department.update_attributes(params[:department])
	end

	def destroy
		@department = Department.find(params[:id])
		@department.destroy
	end

end
