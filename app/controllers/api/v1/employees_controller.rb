class Api::V1::EmployeesController < Api::V1::ApiController

	def create
		@employee = current_user.company.employees.build(employee_profile_parameters)
		if @employee.save
			render json: {:status => "success", :employee => @employee }
		else
			render json: {:errors => "Error", :message => @employee.errors.full_messages }
		end
	end

	def update
		@employee = get_entity Employee.find_by_id(params[:id])
		@employee.update_attributes(employee_profile_parameters)
		if @employee.save
			render json: {:status => "success", :employee => @employee }
		else
			render json: {:errors => "Error", :message => @employee.errors.full_messages }
		end
	end

	def show
		@employee = get_entity Employee.find_by_id(params[:id])
		render json: {:status => "success", :employee => @employee }
	end

	def all_employees
		@employees = current_user.employees
		render json: {:status => "success", :employees => @employees }
	end


	def destroy
		@employee = get_entity Employee.find_by_id(params[:id])
		@employee.destroy
		render json: {:status => "success", :department => "Employee deleted successfully." }
	end

	private

	def employee_profile_parameters
    	params.require(:employee).permit(:first_name, :last_name, :email, :office_phone, :mobile, :fax, :title, :description, :company_id)
  	end
end
