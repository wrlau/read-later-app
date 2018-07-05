class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :category
  belongs_to :subcategory
end
