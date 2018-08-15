class ReadingListSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :articles
  belongs_to :user
end
