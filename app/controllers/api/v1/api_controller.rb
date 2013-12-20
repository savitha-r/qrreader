class Api::V1::ApiController < ApplicationController

	def employee
		@employee = get_entity Employee.find_by_hashed_id(params[:eid]) 
	end
end
