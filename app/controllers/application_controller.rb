class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def scrape_guardian
    Scraper.new.make_categories unless Category.count > 0
  end
  helper_method :scrape_guardian

  def scrape_subcategories(category)
    #binding.pry
    Scraper.make_subcategories(category) if category.subcategories.count == 0
  end
  helper_method :scrape_subcategories

  def scrape_articles(subcategory)
    Scraper.make_articles(subcategory) if subcategory.articles.count == 0
  end
  helper_method :scrape_articles

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end
end
