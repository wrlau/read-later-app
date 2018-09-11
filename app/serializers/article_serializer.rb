class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :name, :url
  belongs_to :category
  belongs_to :subcategory
end
