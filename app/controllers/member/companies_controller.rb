class Member::CompaniesController < ApplicationController

	before_filter :has_no_company, :only => [:new, :create]

	def new
		@company = Company.new
	end

	def create
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
    	params.require(:company).permit(:name, :description, :logo, :email, :address, :fax, :phone, :phone2, :postal_code, :verified, :banned, :published)
  	end

  	def has_no_company
  		unless current_user.company
  			return true
  		end
  		return false
  	end
end
