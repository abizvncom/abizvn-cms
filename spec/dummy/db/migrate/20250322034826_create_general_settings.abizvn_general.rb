# This migration comes from abizvn_general (originally 20241115080211)
class CreateGeneralSettings < ActiveRecord::Migration[7.2]
  def change
    create_table :general_settings do |t|
      t.string :group
      t.string :code
      t.string :value

      t.timestamps
    end
  end
end
