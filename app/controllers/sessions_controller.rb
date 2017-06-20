class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(login: params[:login])
    if user && user.password == params[:password]
      session[:user_id] = user.id
    else
      flash.now.alert = 'Email or password is invalid'
    end
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
