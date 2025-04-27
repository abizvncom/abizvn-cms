class UpdateCategoryRemoveGeneral < ActiveRecord::Migration[7.2]
  def change
    change_table :cms_categories do |t|
      t.string :code
      t.string :name
      t.references :status, foreign_key: { to_table: :general_settings }, index: true
    end

    execute <<-SQL
      UPDATE cms_categories
      SET code = gs.code,
          name = gs.value
      FROM general_settings gs
      WHERE cms_categories.general_id = gs.id
    SQL
    
    change_column_null :cms_categories, :code, false
    change_column_null :cms_categories, :name, false

    remove_reference :cms_categories, :general, index: true, foreign_key: { to_table: :general_settings }
  end
end
