class Admin::CompaniesController < Admin::AdminsController
	
	def new
		@user = get_entity User.find_by_id(params[:user_id])
		@company = @user.build_company
	end

	def create
		@user = get_entity User.find_by_id(params[:user_id])
		@company = @user.build_company(company_profile_parameters)
		if @company.save
			flash[:notice] = "Company successfully created."
			redirect_to admin_root_path
		else
			render "new"
		end
	end

	def edit
		@company = get_entity Company.find_by_id(params[:id])
		@user = @company.user
	end

	def update
		@company = get_entity Company.find_by_id(params[:id])
		@company.update_attributes(company_profile_parameters)
		if @company.save
			flash[:notice] = "Company successfully updated."
			redirect_to admin_root_path			
		else
			render "edit"			
			#rediecrt to index page of companies or show method
		end
	end

	def destroy
		@company = get_entity Company.find_by_id(params[:id])
		@company.destroy
		redirect_to admin_root_path
	end


	private

	def company_profile_parameters
    	params.require(:company).permit(:name, :description, :logo, :email, :address, :fax, :phone, :phone2, :postal_code, :verified, :banned, :published, :user_id)
  	end

end
