class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def edit
  end

  def update
    @article = Article.find(params[:id])
    #binding.pry
    reading_list = current_user.reading_lists.find(params[:article][:reading_list_id])
    reading_list.articles << @article
    if @article.save
      redirect_to reading_list_path(reading_list)
    else
      render :show
    end
  end
end
