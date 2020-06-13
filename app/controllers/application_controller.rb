class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user

  def logged_in?
    session[:user_id]
  end

  def current_user
    @user = User.find(session[:user_id])
  end

  def require_login
    unless logged_in?
      flash.notice = "Must be logged in."
      redirect_to root_path
    end
  end
end
