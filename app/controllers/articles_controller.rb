class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    # p article
  end
end