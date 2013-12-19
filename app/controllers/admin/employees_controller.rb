class Admin::EmployeesController < Admin::AdminsController
	
	def new
		@user = params[:user_id]
		@company = params[:company_id]
		@employee = Employee.new
	end

	def create
		params[:employee][:company_id] = params[:company_id]
		@employee = Employee.create(employee_profile_parameters)
		if @employee.errors.any?
			@user = User.find_by_id(params[:user_id])
			@company =Company.find_by_id(params[:company_id])
			render "new"
		else
			flash[:notice] = "Employee successfully created."
			redirect_to admin_user_user_home_path(@employee.company.user)
		end
	end

	def edit
		@employee = Employee.find(params[:id])
		@company = @employee.company
		@user = @employee.company.user
	end

	def update
		@employee = Employee.find_by_id(params[:id])
		@employee.update_attributes(employee_profile_parameters)
		if @employee.errors.any?
			@user = User.find_by_id(params[:user_id])
			@company =Company.find_by_id(params[:company_id])
			render "edit"
		else
			flash[:notice] = "Employee successfully updated."
			redirect_to admin_user_user_home_path(@employee.company.user)
		end
	end

	def destroy
		@employee = Employee.find(params[:id])
		@employee.destroy
		redirect_to admin_user_user_home_path(@employee.company.user)
	end

	private

	def employee_profile_parameters
    	params.require(:employee).permit(:first_name, :last_name, :email, :office_phone, :mobile, :fax, :title, :description, :company_id)
  	end
end
