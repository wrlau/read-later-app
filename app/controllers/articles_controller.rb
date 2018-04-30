class ArticlesController < ApplicationController
  before_action :require_login, except: :show

  def show
    @article = Article.find(params[:id])
  end

  def edit
  end

  def update
    @article = Article.find(params[:id])

    if params[:article][:reading_list_id]
      reading_list = current_user.reading_lists.find_by(id: params[:article][:reading_list_id])
      reading_list.articles << @article
    elsif params[:article][:reading_list_attributes][:name] != nil || params[:article][:reading_list_attributes][:name] != ""
      reading_list = current_user.reading_lists.find_or_create_by(name: params[:article][:reading_list_attributes][:name])
      reading_list.articles << @article
    end

    if @article.save
      redirect_to user_reading_list_path(current_user.id, reading_list.id)
    else
      render :show
    end
  end

  private

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to save"
      redirect_to new_user_session_path
    end
  end
end
