class AddArticlesCountToCategory < ActiveRecord::Migration[7.2]
  def change
    change_table :cms_categories do |t|
      t.integer :articles_count, null: false, default: 0
    end
  end
end
