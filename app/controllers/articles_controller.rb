class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def edit
  end

  def update
    @article = Article.find(params[:id])
    binding.pry
    if params[:article][:reading_list_attributes][:name]
      reading_list = current_user.reading_lists.find_or_create_by(name: params[:article][:reading_list_attributes][:name])
      reading_list.articles << @article
    elsif params[:article][:reading_list_id] != nil || params[:article][:reading_list_id] != ""
      reading_list = current_user.reading_lists.find(params[:article][:reading_list_id])
      reading_list.articles << @article
    end

    if @article.save
      redirect_to reading_list_path(reading_list)
    else
      render :show
    end
  end
end
