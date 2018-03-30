class Article < ApplicationRecord
  belongs_to :reading_list
  belongs_to :category
  belongs_to :subcategory
end
