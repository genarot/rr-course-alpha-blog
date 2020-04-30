class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :is_owner?, :require_same_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    #Convert in boolean operation
    !!current_user
  end

  def is_owner?(user_id)
    current_user && current_user.id == user_id
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

  def require_same_user
    if current_user != @article.user and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own articles"
      redirect_to root_path
    end
  end
end
