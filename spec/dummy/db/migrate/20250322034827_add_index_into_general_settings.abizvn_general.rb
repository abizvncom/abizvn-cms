# This migration comes from abizvn_general (originally 20241116110614)
class AddIndexIntoGeneralSettings < ActiveRecord::Migration[7.2]
  def change
    add_index :general_settings, [:group, :code], unique: true, name: 'index_general_settings_group_and_code'
  end
end
