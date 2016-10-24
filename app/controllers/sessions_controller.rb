class SessionsController < ApplicationController
  def new
  end
  def create
    user = AdminUser.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalied email/password'
      render 'new'
    end
  end
  def destroy
  end
end
