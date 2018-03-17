class Article < ApplicationRecord
  belongs_to :reading_list
  belongs_to :category
end
