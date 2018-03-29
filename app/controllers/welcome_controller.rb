class WelcomeController < ApplicationController

  def index
    scrape_guardian
    @categories = Category.all
  end

end
