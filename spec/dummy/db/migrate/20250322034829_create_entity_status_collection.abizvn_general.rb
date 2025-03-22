# This migration comes from abizvn_general (originally 20250218110737)
class CreateEntityStatusCollection < ActiveRecord::Migration[7.2]
  def up
    Abizvn::General::GeneralSetting.find_or_create_by!(group: Abizvn::General::ENTITY_STATUS_GROUP_NAME, code: Abizvn::General::ENTITY_STATUS_CODE_DRAFT) do |entity|
      entity.value = 'Draft'
    end
    Abizvn::General::GeneralSetting.find_or_create_by!(group: Abizvn::General::ENTITY_STATUS_GROUP_NAME, code: Abizvn::General::ENTITY_STATUS_CODE_PUBLIC) do |entity|
      entity.value = 'Public'
    end
    Abizvn::General::GeneralSetting.find_or_create_by!(group: Abizvn::General::ENTITY_STATUS_GROUP_NAME, code: Abizvn::General::ENTITY_STATUS_CODE_INVISIBLE) do |entity|
      entity.value = 'Unlist'
    end
    Abizvn::General::GeneralSetting.find_or_create_by!(group: Abizvn::General::ENTITY_STATUS_GROUP_NAME, code: Abizvn::General::ENTITY_STATUS_CODE_PRIVATE) do |entity|
      entity.value = 'Private'
    end
  end

  def down
    list_codes = [
      Abizvn::General::ENTITY_STATUS_CODE_DRAFT,
      Abizvn::General::ENTITY_STATUS_CODE_PUBLIC,
      Abizvn::General::ENTITY_STATUS_CODE_INVISIBLE,
      Abizvn::General::ENTITY_STATUS_CODE_PRIVATE
    ]

    Abizvn::General::GeneralSetting.where(group: Abizvn::General::ENTITY_STATUS_GROUP_NAME, code: list_codes).destroy_all    
  end
end
