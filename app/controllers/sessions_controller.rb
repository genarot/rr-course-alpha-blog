class SessionsController < ApplicationController
  def new

  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:info] = "Logged in successfully"
      redirect_to user
    else
      flash.now[:danger] = "There was something wrong with your login details"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:info] = "Logged Out"
    redirect_to root_path
  end
end