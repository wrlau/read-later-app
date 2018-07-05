class SubcategoriesController < ApplicationController

  def show
    @subcategory = Subcategory.find(params[:id])
    scrape_articles(@subcategory)
    @subcategory.articles
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @subcategory }
    end
  end

end
