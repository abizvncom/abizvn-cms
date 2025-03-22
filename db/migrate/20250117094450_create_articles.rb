class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :cms_articles do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.references :category, foreign_key: { to_table: :cms_categories }
      t.references :status, foreign_key: { to_table: :general_settings }
      t.timestamps
    end
  end
end
