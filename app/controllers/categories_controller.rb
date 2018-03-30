class CategoriesController < ApplicationController

  def index
  end

  def show
    @category = Category.find(params[:id])
    scrape_subcategories
  end

end
