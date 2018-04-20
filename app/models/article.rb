class Article < ApplicationRecord
  belongs_to :reading_list, optional: true
  belongs_to :category
  belongs_to :subcategory

  def reading_list_name
    self.try(:reading_list).try(:name)
  end

  def reading_list_name=(name)
    reading_list = ReadingList.find_or_create_by(name: name)
    self.reading_list = reading_list
  end
end
