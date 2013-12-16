class Member::CompaniesController < ApplicationController
	before_filter :signed_in_artist
	before_filter :has_no_company, :only => [:new, :create]

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


end
