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
    article_form = ArticleForm.new(article_params)

    if article_form.save
      redirect_to action: :index
    else
      @article = article_form.becomes(Article)
      render :new
    end
  end

  def edit
    @article = Article.published.find(params[:id])
  end

  def update
    article_form = ArticleForm.published.find(params[:id])

    if article_form.update(article_params)
      redirect_to action: :index
    else
      @article = article_form.becomes(Article)
      render :edit
    end
  end

  def destroy
    Article.published.find(params[:id]).destroy

    redirect_to action: :index
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :article_category_id)
  end
end
