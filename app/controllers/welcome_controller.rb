class WelcomeController < ApplicationController

  def index
    scrape_guardian
    @categories = Category.all
    @articles = Article.most_saved
  end

end
