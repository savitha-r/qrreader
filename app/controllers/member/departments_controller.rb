class Member::DepartmentsController < Member::MembersController
	
	def new
		@department = Department.new
	end

	def create
		params[:department][:company_id] = current_user.company.id
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
		@department = Department.find_by_id(params[:id])
		@department.update_attributes(department_profile_parameters)
		if @department.errors.any?
			render "edit"
		else
			flash[:notice] = "Department successfully updated."
			redirect_to member_root_path
		end
	end

	def destroy
		@department = Department.find(params[:id])
		@department.destroy
		redirect_to member_root_path
	end

	private

	def department_profile_parameters
    	params.require(:department).permit(:name, :description, :company_id)
  	end

end
