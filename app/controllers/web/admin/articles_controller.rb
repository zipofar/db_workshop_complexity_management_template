# frozen_string_literal: true

class Web::Admin::ArticlesController < Web::Admin::ApplicationController
  def index
    @articles = Article.all
    @ratings = ArticleService.article_ratings(@articles)
  end

  def show
    article
  end

  def edit
    article
  end

  def update
    article_form = ArticleForm.find(params[:id])

    if article_form.update(article_params)
      redirect_to action: :index
    else
      @article = article_form.becomes(Article)
      render :edit
    end
  end

  def destroy
    article.destroy

    redirect_to action: :index
  end

  def publish
    if article.publish!
      redirect_to action: :index
    else
      render :edit
    end
  end

  def archive
    if article.archive!
      redirect_to action: :index
    else
      render :edit
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :article_category_id)
  end

  def article
    @article ||= Article.find(params[:id])
  end
end
