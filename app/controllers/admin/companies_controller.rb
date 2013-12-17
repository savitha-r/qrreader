class Admin::CompaniesController < ApplicationController
	
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

	def destroy
		@company = Company.find(params[:id])
		@company.destroy
	end


	def index
		@companies = Company.all
	end

end
