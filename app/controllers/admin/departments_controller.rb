class Admin::DepartmentsController < Admin::AdminsController
	
	def new
		@company = get_entity Company.find_by_id(params[:company_id])
		@department = @company.build_department
	end

	def create
		@company = get_entity Company.find_by_id(params[:company_id])
		@department = @user.build_department(department_profile_parameters)
		if @department.save
			flash[:notice] = "Department successfully created."
			redirect_to admin_root_path
		else
			render "new"
		end
	end

	def edit
		@department = get_entity Department.find_by_id(params[:id])
		@company = @department.company
	end

	def update
		@department = get_entity Department.find_by_id(params[:id])
		@department.update_attributes(company_profile_parameters)
		if @department.save
			flash[:notice] = "Department successfully updated."
			redirect_to admin_root_path			
		else
			render "edit"			
			#rediecrt to index page of companies or show method
		end
	end

	def destroy
		@department = get_entity Department.find_by_id(params[:id])
		@department.destroy
		redirect_to admin_user_user_home_path(@department.company.user)
	end

	private

	def department_profile_parameters
    	params.require(:department).permit(:name, :description, :company_id)
  	end
end
