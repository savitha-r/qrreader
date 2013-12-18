class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :signed_in_user
	
  include SessionsHelper

  

  #shd not be here since controller is visible everywhere
  

  
end
