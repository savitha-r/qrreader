class Member::CompaniesController < ApplicationController

	before_filter :has_no_company, :only => [:new, :create]

	def new
		@company = Company.new
	end

	def create
		params[:company][:user_id] = current_user.id
		@company = Company.create(company_profile_parameters)
		if @company.errors.any?
			render "new"
		else
			flash[:notice] = "Company successfully created."
			redirect_to member_root_path
		end
	end

	def edit
		@company = Company.find(params[:id])
	end

	def update
		@company.update_attributes(params[:company])
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
