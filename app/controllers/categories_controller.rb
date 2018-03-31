class CategoriesController < ApplicationController

  def index
  end

  def show
    #binding.pry
    @category = Category.find(params[:id])
    scrape_subcategories(@category)
  end

end
