module Abizvn
  module Cms
    class CategoryLiteSerializer
      include JSONAPI::Serializer

      attributes :id, :code, :name, :title
    end
  end
end
