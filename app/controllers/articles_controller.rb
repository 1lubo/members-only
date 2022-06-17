# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit]
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
      flash[:success] = 'Article was edited successfully.'
    else
      flash[:danger] = @article.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to @article
      flash[:success] = 'New article created successfully.'
    else
      flash[:danger] = @article.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  private

  def article_params
    params.require(:article).permit(:user_id, :title, :text)
  end
end
