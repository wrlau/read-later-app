class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @categories }
    end
  end

  def show
    #binding.pry
    @category = Category.find(params[:id])
    scrape_subcategories(@category)
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @category }
    end
  end

end
