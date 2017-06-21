class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_user_context

  def store_user_context
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_info
    { id: @current_user.id, login: @current_user.login, role: @current_user.role }
  end

  private

  def logged_in?
    session[:user_id].present?
  end

  helper_method :logged_in?, :user_info
end
