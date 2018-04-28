class Article < ApplicationRecord
  belongs_to :reading_list, optional: true
  accepts_nested_attributes_for :reading_list
  belongs_to :category
  belongs_to :subcategory

  def self.most_saved
    Article.where.not(reading_list_id: nil)
  end
end
