class HomeController < ApplicationController
	before_filter :signed_in_user, :except => [:index]

	def home
		@member = current_user
		@company = @member.company
	end

	def index
	end

end
