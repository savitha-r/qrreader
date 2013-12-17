class Member::CompaniesController < ApplicationController
	before_filter :has_no_company, :only => [:new, :create]

	def new
		@company = Company.new
	end

	def create
		@company = Company.new(params[:company])
		@company.save!
	end

	def edit
		@company = Company.find(params[:id])
	end

	def update
		@company.update_attributes(params[:company])
	end

	private

	def has_no_company
		unless current_user.company
			return true
		end
		return false
	end


end
