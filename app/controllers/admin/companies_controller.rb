class Admin::CompaniesController < ApplicationController
	before_filter :signed_in_artist

	def new
		@company = Company.new
	end

	def create
		@company.update_attributes(params(:company))
	end

	def edit
		@company = Company.find(params[:id])
	end

	def update
		@company.update_attributes(params[:company])
	end

	def destroy
		@company = Company.find(params[:id])
		@company.destroy
	end


	def index
		@companies = Company.all
	end

end
