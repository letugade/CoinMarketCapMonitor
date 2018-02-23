module SessionsHelper

  def sign_in(user)
    session[:user_id] = user.id
  end

  def current_user=(user)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    session[:user_id] = nil
    self.current_user = nil
  end

  def current_user?(user)
    user == current_user
  end

  def deny_access
    session[:denied] = true
    redirect_to '/login'
  end

end
