class Api::V1::CompaniesController < Api::ApiController

	before_filter :has_no_company, :only => [:new, :create]

	def create
		@company = current_user.build_company(company_profile_parameters)
		if @company.save
			render json: {:status_code => Api::ApiController::SUCCESS, :status => "success", :company => @company }, :status_code => 200
		else
			render_errors(Api::ApiController::INVALID, @company.errors)
		end
	end

	def update
		@company = current_user.company
		@company.update_attributes(company_profile_parameters)
		if @company.save
			render json: {:status_code => Api::ApiController::SUCCESS, :status => "success", :company => @company }, :status_code => 200
		else
			render_errors(Api::ApiController::INVALID, @company.errors)
		end
	end

	def show
		@company = get_entity current_user.company
		render json: {:status_code => Api::ApiController::SUCCESS, :status => "success", :company => @company }, :status_code => 200
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
