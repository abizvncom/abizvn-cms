class CreateCategory < ActiveRecord::Migration[7.2]
  def change
    create_table :cms_categories do |t|
      t.references :general, null: false, foreign_key: { to_table: :general_settings }
      t.string :tag, null: false, default: ''
      t.timestamps
    end
  end
end
