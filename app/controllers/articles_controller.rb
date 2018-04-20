class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def edit
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :show
    end
  end

  private
  
  def article_params
    params.require(:article).permit(:reading_list_name)
  end
end
