module Abizvn
  module Cms
    class CategoryLiteSerializer
      include JSONAPI::Serializer

      attributes :id, :code, :tag, :name, :title
    end
  end
end
