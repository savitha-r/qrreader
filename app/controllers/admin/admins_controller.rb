class Admin::AdminsController < ApplicationController
	before_filter :check_super_admin

	def check_super_admin
		unless current_user.is_super_admin?
			redirect_to member_root_path
		end
		#add notice
	end

end
