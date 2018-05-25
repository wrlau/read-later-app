require_dependency '../validators/url_validator.rb'

class Article < ApplicationRecord
  validates :name, presence: true
  validates :url, url: true
  belongs_to :reading_list, optional: true
  accepts_nested_attributes_for :reading_list
  belongs_to :category
  belongs_to :subcategory

  def self.most_saved
    Article.where.not(reading_list_id: nil)
  end
end
