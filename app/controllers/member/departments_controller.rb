class Member::DepartmentsController < Member::MembersController
	
	def new
		@department = current_user.company.departments.build
	end

	def create
		@department = current_user.company.departments.build(department_profile_parameters)
		if @department.save
			flash[:notice] = "Department successfully created."
			redirect_to member_root_path
		else
			render "new"
		end
	end

	def edit
		@department = get_entity Department.find_by_id(params[:id])
	end

	def update
		@department = get_entity Department.find_by_id(params[:id])
		@department.update_attributes(department_profile_parameters)
		if @department.save
			flash[:notice] = "Department successfully updated."
			redirect_to member_root_path
		else
			render "edit"
		end
	end

	def destroy
		@department = get_entity Department.find_by_id(params[:id])
		@department.destroy
		redirect_to member_root_path
	end

	private

	def department_profile_parameters
    	params.require(:department).permit(:name, :description, :company_id)
  	end

end
