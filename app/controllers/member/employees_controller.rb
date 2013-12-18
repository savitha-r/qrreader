class Member::EmployeesController < ApplicationController
	
	def new
		@employee = Employee.new
	end

	def create
		params[:employee][:company_id] = current_user.company.id
		@employee = Employee.create(employee_profile_parameters)
		if @employee.errors.any?
			render "new"
		else
			flash[:notice] = "Employee successfully created."
			redirect_to member_root_path
		end
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

	private

	def employee_profile_parameters
    	params.require(:employee).permit(:first_name, :last_name, :email, :office_phone, :mobile, :fax, :title, :description, :company_id)
  	end

end
