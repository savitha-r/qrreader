class Admin::CompaniesController < Admin::AdminsController
	
	def new
		@user = User.find_by_id(params[:user_id])
		@company = Company.new
	end

	def create
		params[:company][:user_id] = params[:user_id]
		@company = Company.create(company_profile_parameters)
		if @company.errors.any?
			@user = User.find_by_id(params[:user_id])
			render "new"
		else
			flash[:notice] = "Company successfully created."
			redirect_to admin_root_path
		end
	end

	def edit
		@company = Company.find(params[:id])
		@user = User.find_by_id(params[:user_id])
	end

	def update
		@company = Company.find(params[:id])
		@company.update_attributes(company_profile_parameters)
		if @company.errors.any?
			@user = User.find_by_id(params[:user_id])
			render "edit"
		else
			flash[:notice] = "Company successfully updated."
			redirect_to admin_root_path
		end
	end

	def destroy
		@company = Company.find(params[:id])
		@company.destroy
		redirect_to admin_root_path
	end


	private

	def company_profile_parameters
    	params.require(:company).permit(:name, :description, :logo, :email, :address, :fax, :phone, :phone2, :postal_code, :verified, :banned, :published, :user_id)
  	end

end
