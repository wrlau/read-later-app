class ArticlesController < ApplicationController
  before_action :require_login, except: :show
  before_action :set_article, only: [:show, :edit, :update]

  def show
    #@article.build_reading_list
  end

  def edit
    render :show
  end

  def update
    if params[:commit] == "Rate Article"
      update_rating
    elsif params[:commit] == "Save to Reading List"
      save_to_list
    end

    if @article.save(article_params) && params[:commit] == "Save to Reading List"
      flash[:notice] = "Article saved!"
    elsif @article.save(article_params)
      flash[:notice] = "Article rated!"
    end
    render :show
  end

  private

  def save_to_list
    if params[:article][:reading_list_id] != ""
      reading_list = current_user.reading_lists.find_by(id: params[:article][:reading_list_id])
      reading_list.articles << @article
    elsif params[:article][:reading_list_attributes][:name] != nil || params[:article][:reading_list_attributes][:name] != ""
      reading_list = current_user.reading_lists.find_or_create_by(name: params[:article][:reading_list_attributes][:name])
      reading_list.articles << @article
    end
  end

  def update_rating
    if params[:article][:rating] == ""
      @article.rating = nil
    else
      @article.rating = params[:article][:rating]
    end
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:rating, :reading_list_id, reading_list_attributes: [:id, :name, :user_id])
  end

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to save"
      redirect_to new_user_session_path
    end
  end
end
