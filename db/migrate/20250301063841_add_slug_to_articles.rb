class AddSlugToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :cms_articles, :slug, :string
    add_index :cms_articles, :slug, unique: true
  end
end
