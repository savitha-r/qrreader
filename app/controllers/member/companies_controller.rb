class Member::CompaniesController < Member::MembersController

	before_filter :has_no_company, :only => [:new, :create]

	def new
		@company = current_user.build_company
	end

	def create
		@company = current_user.build_company(company_profile_parameters)
		if @company.save
			flash[:notice] = "Company successfully created."
			redirect_to member_root_path
		else
			render "new"
		end
	end

	def edit
		@company = current_user.company
	end

	def update
		@company = current_user.company
		@company.update_attributes(company_profile_parameters)
		if @company.save
			flash[:notice] = "Company successfully updated."
			redirect_to member_root_path
		else
			render "edit"
		end
	end

	private

	def company_profile_parameters
    	params.require(:company).permit(:name, :description, :logo, :email, :address, :fax, :phone, :phone2, :postal_code, :verified, :banned, :published, :user_id)
  	end

  	def has_no_company
  		if current_user.company
  			redirect_to member_root_path
  		end
  	end
end
