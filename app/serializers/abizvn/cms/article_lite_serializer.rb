module Abizvn
  module Cms
    class ArticleLiteSerializer
      include JSONAPI::Serializer

      attributes :title, :updated_at

      attribute :id do |article| article.slug || article.id end
    end
  end
end

