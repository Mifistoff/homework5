class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protect_from_forgery with: :exception

  private

  def logged_in?
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_info
    { id: session[:user_id], login: @current_user.login, role: @current_user.role }
  end

  helper_method :logged_in?, :user_info
end
