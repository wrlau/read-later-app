class AddRatingsToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :rating, :integer
  end
end
