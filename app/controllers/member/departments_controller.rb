class Member::DepartmentsController < ApplicationController
	
	def new
		@department = Department.new
	end

	def create
		
		@department = Department.create(department_profile_parameters)
		if @department.errors.any?
			render "new"
		else
			flash[:notice] = "Department successfully created."
			redirect_to member_root_path
		end
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

	private

	def department_profile_parameters
    	params.require(:department).permit(:name, :description)
  	end

end
