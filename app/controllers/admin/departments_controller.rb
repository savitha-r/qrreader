class Admin::DepartmentsController < Admin::AdminsController
	
	def new
		@department = Department.new
		@company = Company.find_by_id(params[:company_id])
		@user = User.find_by_id(params[:user_id])
	end

	def create
		params[:department][:company_id] = params[:company_id]
		@department = Department.create(department_profile_parameters)
		if @department.errors.any?
			@user = User.find_by_id(params[:user_id])
			@company =Company.find_by_id(params[:company_id])
			render "new"
		else
			flash[:notice] = "Department successfully created."
			redirect_to admin_user_home_path(User.find(params[:user_id]))
		end
	end

	def edit
		@department = Department.find(params[:id])
		@company = Company.find_by_id(params[:company_id])
		@user = User.find_by_id(params[:user_id])
	end

	def update
		@department = Department.find_by_id(params[:id])
		@department.update_attributes(department_profile_parameters)
		if @department.errors.any?
			@user = User.find_by_id(params[:user_id])
			@company =Company.find_by_id(params[:company_id])
			render "edit"
		else
			flash[:notice] = "Department successfully updated."
			redirect_to admin_user_home_path(User.find(params[:user_id]))
		end
	end

	def destroy
		@department = Department.find(params[:id])
		@department.destroy
		redirect_to admin_user_home_path(User.find(params[:user_id]))
	end

	private

	def department_profile_parameters
    	params.require(:department).permit(:name, :description, :company_id)
  	end
end
