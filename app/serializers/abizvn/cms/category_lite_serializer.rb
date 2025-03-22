module Abizvn
  module Cms
    class CategoryLiteSerializer
      include JSONAPI::Serializer

      attributes :id

      attribute :code do |entity|
        entity.general.code
      end

      attribute :value do |entity|
        entity.general.value
      end
    end
  end
end
