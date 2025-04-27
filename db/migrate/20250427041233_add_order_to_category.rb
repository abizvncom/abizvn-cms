class AddOrderToCategory < ActiveRecord::Migration[7.2]
  def change
    add_column :cms_categories, :order, :integer, default: 0, null: false
  end
end
