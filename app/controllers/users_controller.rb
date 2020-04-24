class UsersController < ApplicationController

  def new
    @user = User.new
    render 'signup'
  end

  def create
    @user = User.new(user_params)
    byebug
    if @user.save
      flash[:notice]= "Welcome to the Alpha Blog #{@user.username}, you have successfully signed up"
      redirect_to articles_path
    else
      render 'signup'
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user.nil?
      render ''
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end