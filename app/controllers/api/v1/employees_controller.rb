class Api::V1::EmployeesController < Api::ApiController

	def create
		@employee = current_user.company.employees.build(employee_profile_parameters)
		if @employee.save
			rrender json: {:status_code => Api::ApiController::SUCCESS, :status => "success", :employee => @employee }, :status_code => 200
		else
			render_errors(Api::ApiController::INVALID, @employee.errors)
		end
	end

	def update
		@employee = get_entity Employee.find_by_id(params[:id])
		@employee.update_attributes(employee_profile_parameters)
		if @employee.save
			render json: {:status_code => Api::ApiController::SUCCESS, :status => "success", :employee => @employee }, :status_code => 200
		else
			render_errors(Api::ApiController::INVALID, @employee.errors)
		end
	end

	def show
		id,secure_id = params[:eid][0...-4],params[:eid][-4,4]
		@employee = get_entity Employee.find_by_id(id)

		unless @employee.secure_id == secure_id
			raise Errors::NotFound
		end
	end

	def all_employees
		@employees = current_user.employees
		render_errors(Api::ApiController::INVALID, @employee.errors)
	end


	def destroy
		@employee = get_entity Employee.find_by_id(params[:id])
		@employee.destroy
		render json: {:status_code => Api::ApiController::SUCCESS, :status => "success", :message => "Employee deleted successfully." }, :status_code => 200
	end

	private

	def employee_profile_parameters
    	params.require(:employee).permit(:first_name, :last_name, :email, :office_phone, :mobile, :fax, :title, :description, :company_id)
  	end
end
