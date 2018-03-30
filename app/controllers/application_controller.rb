class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def scrape_guardian
    Scraper.new.make_categories unless Category.count > 1
  end
  helper_method :scrape_guardian

  def scrape_subcategories(url)
    Scraper.new.make_subcategories(url) unless Subcategory.count > 1
  end
  helper_method :scrape_subcategories

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end
end
