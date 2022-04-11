class ArticlesController < ApplicationController
  include ApplicationHelper
  #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all.sort {|a, b| b <=> a}
  end

  def showAll
      @articles = Article.all.sort {|a, b| b <=> a}
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to user_article_path(current_user, @article)
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to user_path(current_user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to user_path(current_user), status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status, :user_id)
    end



end
