# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.published
  end

  def show
    @article = Article.published.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = category.articles.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.published.find(params[:id])
  end

  def update
    @article = Article.published.find(params[:id])

    if @article.update(article_params.merge({ article_category_id: category.id }))
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  def publish
    @article = Article.find(params[:id])

    if @article.publish!
      redirect_to @article
    else
      render :edit
    end
  end

  def archive
    @article = Article.find(params[:id])

    if @article.archive!
      redirect_to @article
    else
      render :edit
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def category
    @category ||= Article::Category.find(params[:article][:article_category_id])
  end
end
