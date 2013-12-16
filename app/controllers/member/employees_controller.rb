class Member::EmployeesController < ApplicationController
	before_filter :signed_in_artist

	def new
		@employee = Employee.new
	end

	def create
		@employee.update_attributes(params(:employee))
	end

	def edit
		@employee = Employee.find(params[:id])
	end

	def update
		@employee.update_attributes(params[:employee])
	end

	def destroy
		@employee = Employee.find(params[:id])
		@employee.destroy
	end

end
