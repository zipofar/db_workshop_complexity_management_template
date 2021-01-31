# frozen_string_literal: true

class Web::Admin::ArticlesController < Web::Admin::ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    article_mutator = ArticleMutator.new(@article)

    if article_mutator.update(article_params, category)
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
