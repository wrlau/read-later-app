class AddSubcategoryIdsToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :subcategory_id, :integer
  end
end
