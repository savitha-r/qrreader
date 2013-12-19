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
		@employee = get_entity Employee.find_by_hashed_id(params[:eid])
	end

end
