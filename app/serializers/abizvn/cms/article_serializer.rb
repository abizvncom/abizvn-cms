module Abizvn
  module Cms
    class ArticleSerializer < ArticleLiteSerializer
      attributes :description, :full_content
    
      attribute :category do |article|
        if article.category
          CategoryLiteSerializer.new(article.category).serializable_hash[:data][:attributes]
        end
      end
    end
  end
end
