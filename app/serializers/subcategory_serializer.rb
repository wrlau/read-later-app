class SubcategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :category
  has_many :articles
end
