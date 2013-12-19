class Member::EmployeesController < Member::MembersController
	
	def new
		@employee = current_user.company.employees.build
	end

	def create
		@employee = current_user.company.employees.build(employee_profile_parameters)
		if @employee.save
			flash[:notice] = "Employee successfully created."
			redirect_to member_root_path
		else
			render "new"
		end
	end

	def edit
		@employee = get_entity Employee.find_by_id(params[:id])
	end

	def update
		@employee = get_entity Employee.find_by_id(params[:id])
		@employee.update_attributes(employee_profile_parameters)
		if @employee.save
			flash[:notice] = "Employee successfully updated."
			redirect_to member_root_path
		else
			render "edit"
		end
	end

	def destroy
		@employee = get_entity Employee.find_by_id(params[:id])
		@employee.destroy
		redirect_to member_root_path
	end

	private

	def employee_profile_parameters
    	params.require(:employee).permit(:first_name, :last_name, :email, :office_phone, :mobile, :fax, :title, :description, :company_id)
  	end

end
