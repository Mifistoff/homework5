class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protect_from_forgery with: :exception

  private

  def logged_in?
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_login
    @current_user.login
  end

  helper_method :logged_in?, :user_login
end
