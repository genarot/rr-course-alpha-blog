class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    # before action does it for us
    # set_article
    # p article
  end

  def index
    # @articles = Article.all
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(extract_article_params)
    @article.user = User.first
    
    if @article.save
      flash[:notice] = "Article was created successfully!"
      redirect_to article_path(@article)
      # redirect_to @article
      # render plain: @article.inspect
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(extract_article_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def extract_article_params
    params.require(:article).permit(:title, :description)
  end
end