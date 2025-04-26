class UpdateCategoryRemoveGeneral < ActiveRecord::Migration[7.2]
  def change
    change_table :cms_categories do |t|
      t.string :code
      t.string :name
      t.references :status, foreign_key: { to_table: :general_settings }, index: true
    end

    Abizvn::Cms::Category.find_each do |category|
      code = category.general.present? ? category.general.code : "code_of_#{category.id}"
      name = category.general.present? ? category.general.value : "name_of_#{category.id}"
      category.update_columns(code: code, name: name)
    end
    
    change_column_null :cms_categories, :code, false
    change_column_null :cms_categories, :name, false

    remove_reference :cms_categories, :general, index: true, foreign_key: { to_table: :general_settings }
  end
end
