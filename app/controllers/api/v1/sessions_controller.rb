class Api::V1::SessionsController < Api::ApiController


	def sign_in
		@member = get_entity User.find_by_email(params[:email])
		if @member.authenticate(params[:password])
			login(@member)
			@member.assign_access_token
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
