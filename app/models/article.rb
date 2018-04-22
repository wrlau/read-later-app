class Article < ApplicationRecord
  belongs_to :reading_list, optional: true
  accepts_nested_attributes_for :reading_list
  belongs_to :category
  belongs_to :subcategory
=begin
  def reading_list_name
    self.try(:reading_list).try(:name)
  end

  def reading_list_name=(name)
    reading_list = ReadingList.find_or_create_by(name: name)
    self.reading_list = reading_list
  end
=end
end
