class SubcategoriesController < ApplicationController

  def show
    @subcategory = Subcategory.find(params[:id])
    scrape_articles(@subcategory)
    @subcategory.articles
  end

end
