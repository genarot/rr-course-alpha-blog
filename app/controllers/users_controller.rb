class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update]

  def new
    @user = User.new
    render 'signup'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:info]= "Welcome to the Alpha Blog #{@user.username}, you have successfully signed up"
      session[:user_id] = @user.id
      redirect_to articles_path
    else
      render 'signup'
    end
  end

  def edit
    if @user.nil?
      render ''
    end
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def index
    # @users = User.paginate(page: params[:page], per_page: 5)
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def update
    if @user.update(user_params)
      flash[:info] = "Your account information was successfully updated"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end
end