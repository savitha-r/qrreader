class Api::V1::DepartmentsController < Api::ApiController

	def create
		@department = current_user.company.departments.build(department_profile_parameters)
		if @department.save
			render json: {:status_code => Api::ApiController::SUCCESS, :status => "success", :department => @department }, :status_code => 200
		else
			render_errors(Api::ApiController::INVALID, @department.errors)
		end
	end

	def update
		@department = get_entity Department.find_by_id(params[:id])
		@department.update_attributes(department_profile_parameters)
		if @department.save
			render json: {:status_code => Api::ApiController::SUCCESS, :status => "success", :department => @department }, :status_code => 200
		else
			render_errors(Api::ApiController::INVALID, @department.errors)
		end
	end

	def show
		@department = get_entity Department.find_by_id(params[:id])
		render json: {:status_code => Api::ApiController::SUCCESS, :status => "success", :department => @department }, :status_code => 200
	end

	def all_departments
		@departments = current_user.departments
		render json: {:status_code => Api::ApiController::SUCCESS, :status => "success", :department => @departments }, :status_code => 200
	end


	def destroy
		@department = get_entity Department.find_by_id(params[:id])
		@department.destroy
		render json: {:status_code => Api::ApiController::SUCCESS, :status => "success", :message => "Department deleted successfully." }, :status_code => 200
	end

	private

	def department_profile_parameters
    	params.require(:department).permit(:name, :description, :company_id)
  	end


end
