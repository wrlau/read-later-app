require_dependency '../validators/url_validator.rb'

class Subcategory < ApplicationRecord
  validates :name, presence: true
  validates :url, url: true
  belongs_to :category
  has_many :articles
end
