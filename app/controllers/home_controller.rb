class HomeController < ApplicationController
	before_filter :signed_in_user, :except => [:index, :employee]
	#skip_before

	def home
		@member = current_user
		@company = @member.company
	end

	def index
	end

	def employee
		id,secure_id = params[:eid][0...-4],params[:eid][-4,4]
		@employee = get_entity Employee.find_by_id(id)

		unless @employee.secure_id == secure_id
			raise Errors::NotFound
		end
	end

end
