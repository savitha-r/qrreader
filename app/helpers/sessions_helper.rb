module SessionsHelper

  def login(member)
    cookies.permanent[:remember_token] = member.remember_token
    self.current_user = member
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user=(member)
    @current_user = member
  end

  def current_user
    if @current_user.nil? and cookies[:remember_token].nil?
      return nil
    end
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def logout
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def current_user?(member)
      member == current_user
  end

  def signed_in_user
    unless logged_in?
      redirect_to root_path
    end
  end

  def check_access_token
    @user = get_entity User.find_by_id(params[:id])
    unless @user.access_token == params[:access_token]
      raise Errors::NotFound
    end
  end

end
