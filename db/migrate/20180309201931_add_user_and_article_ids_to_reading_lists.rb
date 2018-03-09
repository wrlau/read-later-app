class AddUserAndArticleIdsToReadingLists < ActiveRecord::Migration[5.1]
  def change
    add_column :reading_lists, :user_id, :integer
    add_column :reading_lists, :article_id, :integer
  end
end
