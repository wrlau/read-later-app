require_dependency '../validators/url_validator.rb'

class Category < ApplicationRecord
  validates :name, presence: true
  validates :url, url: true
  has_many :articles
  has_many :subcategories
end
