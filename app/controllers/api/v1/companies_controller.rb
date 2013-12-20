class Api::V1::CompaniesController < Api::V1::ApiController

	before_filter :has_no_company, :only => [:new, :create]

	def create
		@company = current_user.build_company(company_profile_parameters)
		if @company.save
			render json: {:status => "success", :company => @company }
		else
			render json: {:errors => "Error", :message => @company.errors.full_messages }
		end
	end

	def update
		@company = current_user.company
		@company.update_attributes(company_profile_parameters)
		if @company.save
			render json: {:status => "success", :company => @company }
		else
			render json: {:errors => "Error", :message => @company.errors.full_messages }
		end
	end

	def show
		@company = get_entity current_user.company
		render json: {:status => "success", :company => @company }
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
