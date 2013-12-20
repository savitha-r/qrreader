class Api::V1::SessionsController < Api::V1::ApiController

	before_filter :signed_in_user, :except => [:sign_in]

	def sign_in
		@member = get_entity User.find_by_email(params[:email])
		if @member.authenticate(params[:password])
			login(@member)
			render json: {:status => "success", :member => @member }
		else
			render :json => { :errors => "User authenticate unsuccessful." }
		end
	end

	def sign_out
		logout
		render json: {:status => "success", :message => "User logout successful." }
	end

end
