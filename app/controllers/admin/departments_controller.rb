class Admin::DepartmentsController < Admin::AdminsController
	
	def new
		@department = Department.new
	end

	def create
		@department = Department.new(params[:department])
		@department.save!
	end

	def edit
		@department = Department.find(params[:id])
	end

	def update
		@department.update_attributes(params[:department])
	end

	def destroy
		@department = Department.find(params[:id])
		@department.destroy
	end


	def index
		@departments = Department.all
	end
end
