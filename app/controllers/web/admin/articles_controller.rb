# frozen_string_literal: true

class Web::Admin::ArticlesController < Web::Admin::ApplicationController
  def index
    @articles = Article.includes(:ratings).where('article_ratings.article_id IS NULL OR article_ratings.is_current_rating = ?', true).references(:ratings)
  end

  def show
    article
  end

  def edit
    article
  end

  def update
    article_form = article.becomes(Admin::UpdateArticleForm)

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
    params.require(:article)
  end

  def article
    @article ||= Article.find(params[:id])
  end
end
