class UsersController < ApplicationController
  def allowed_params
    params.require(:user).permit(:login, :password_digest, :password_confirmation)
  end
end
