module Abizvn
  module Cms
    class CategoryLiteSerializer
      include JSONAPI::Serializer

      attributes :id, :code, :name, :updated_at
    end
  end
end
