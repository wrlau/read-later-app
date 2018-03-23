class ChangeUrlToBeStringInArticles < ActiveRecord::Migration[5.1]
  def change
    change_column :articles, :url, :string
  end
end
