class Admin::EmployeesController < Admin::AdminsController
	
	def new
		@company = get_entity Company.find_by_id(params[:company_id])
		@employee = @company.employees.build
		@company.departments.build
	end

	def create
		@company = get_entity Company.find_by_id(params[:company_id])
		@employee = @company.employees.build(employee_profile_parameters)
		if @employee.save
			flash[:notice] = "Employee successfully created."
			redirect_to admin_root_path
		else
			render "new"
		end
	end

	def edit
		@employee = get_entity Employee.find_by_id(params[:id])
		@company = @employee.company
		@company.departments.build
	end

	def update
		@employee = get_entity Employee.find_by_id(params[:id])
		@employee.update_attributes(employee_profile_parameters)
		if @employee.save
			flash[:notice] = "Employee successfully updated."
			redirect_to admin_root_path			
		else
			render "edit"			
			#rediecrt to index page of companies or show method
		end
	end

	def destroy
		@employee = get_entity Employee.find_by_id(params[:id])
		@employee.destroy
		redirect_to admin_user_user_home_path(@employee.company.user)
	end

	private

	def employee_profile_parameters
    	params.require(:employee).permit(:first_name, :last_name, :email, :office_phone, :mobile, :fax, :title, :description, :company_id, department_attributes: [:id])
  	end
end
