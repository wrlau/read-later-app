class Article < ApplicationRecord
  belongs_to :reading_list, optional: true
  belongs_to :category
  belongs_to :subcategory
end
