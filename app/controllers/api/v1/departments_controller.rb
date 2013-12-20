class Api::V1::DepartmentsController < Api::V1::ApiController

	def create
		@department = current_user.company.departments.build(department_profile_parameters)
		if @department.save
			render json: {:status => "success", :department => @department }
		else
			render json: {:errors => "Error", :message => @department.errors.full_messages }
		end
	end

	def update
		@department = get_entity Department.find_by_id(params[:id])
		@department.update_attributes(department_profile_parameters)
		if @department.save
			render json: {:status => "success", :department => @department }
		else
			render json: {:errors => "Error", :message => @department.errors.full_messages }
		end
	end

	def show
		@department = get_entity Department.find_by_id(params[:id])
		render json: {:status => "success", :department => @department }
	end

	def all_departments
		@departments = current_user.departments
		render json: {:status => "success", :departments => @departments}
	end


	def destroy
		@department = get_entity Department.find_by_id(params[:id])
		@department.destroy
		render json: {:status => "success", :department => "Department deleted successfully." }
	end

	private

	def department_profile_parameters
    	params.require(:department).permit(:name, :description, :company_id)
  	end


end
