class AddNewFieldsToCategory < ActiveRecord::Migration[7.2]
  def change
    add_column :cms_categories, :title, :string
    add_column :cms_categories, :description, :text
  end
end
