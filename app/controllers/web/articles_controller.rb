# frozen_string_literal: true

class Web::ArticlesController < Web::ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.published
  end

  def show
    article
  end

  def new
    @article = Article.new
  end

  def create
    article_form = ArticleForm.new(article_params)
    article_form.user = current_user

    if article_form.save
      redirect_to action: :index
    else
      @article = article_form.becomes(Article)
      render :new
    end
  end

  def edit
    article
  end

  def update
    article_form = article.becomes(ArticleForm)

    authorize(article)

    if article_form.update(article_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    authorize(article)

    article.destroy

    redirect_to action: :index
  end

  private

  def article_params
    params.require(:article)
  end

  def article
    @article ||= Article.published.find(params[:id])
  end
end
