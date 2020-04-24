class UsersController < ApplicationController

  def new
    @user = User.new
    render 'signup'
  end

  def create
    byebug
  end
end