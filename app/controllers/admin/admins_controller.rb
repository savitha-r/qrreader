class Admin::AdminsController < ApplicationController
	before_filter :is_super_admin

	def is_super_admin
		unless current_user.is_super_admin?
			redirect_to member_root_path
		end
	end

end
