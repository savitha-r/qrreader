class Admin::EmployeesController < ApplicationController
	
	def new
		@employee = Employee.new
	end

	def create
		@employee = Employee.new(params[:employee])
		@employee.save!
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


	def index
		@employees = Employee.all
	end
end
