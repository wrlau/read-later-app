class RemoveArticleFromReadingLists < ActiveRecord::Migration[5.1]
  def change
    remove_column :reading_lists, :article_id, :integer
  end
end
