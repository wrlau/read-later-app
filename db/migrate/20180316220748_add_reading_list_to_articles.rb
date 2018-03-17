class AddReadingListToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :reading_list_id, :integer
  end
end
