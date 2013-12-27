class Api::ApiController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :check_access_token
	
  include SessionsHelper
  
  rescue_from Errors::NotFound, :with => :custom_error

  INVALID = "INVALID REUEST"
  NOTFOUND = "ENTITY NOT FOUND"
  UNKNOWN = "UNKNOWN ERROR"
  SUCCESS = "SUCCESS"
  
 
  def get_entity entity
  	raise Errors::NotFound unless entity.present?
    return entity
  end

  def custom_error
  	render_errors(NOTFOUND, ["Entity not Found."])
  end

  def render_errors status_code, errors, http_code = 400
  	render json: {status_code: status_code, errors: errors, status: "error", accessing_time: Time.now.to_i}, status: http_code
  end

end
