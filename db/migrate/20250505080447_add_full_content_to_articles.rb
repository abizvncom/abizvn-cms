class AddFullContentToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :cms_articles, :full_content, :text
  end
end
