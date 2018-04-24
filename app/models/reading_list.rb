class ReadingList < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :articles
end
