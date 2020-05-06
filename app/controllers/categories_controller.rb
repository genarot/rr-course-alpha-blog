class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show

  end

  def create
    @category = Category.new(extract_params)
    # Byebug
    # p @category
    if @category.save
      flash[:success] = "Category was created successfully"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def new
    @category = Category.new
  end

  private
  def extract_params
    params.require(:category).permit(:name, :description)
  end
end