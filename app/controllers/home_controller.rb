class HomeController < ApplicationController

	def home
		@member = current_user
		@company = @member.company
	end

	def index
	end

end
