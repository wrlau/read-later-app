class Article < ApplicationRecord
  has_many :reading_lists
  has_many :users, through: :reading_lists
  belongs_to :category
end
