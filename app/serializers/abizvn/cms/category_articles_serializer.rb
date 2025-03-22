module Abizvn
  module Cms
    class CategoryArticlesSerializer < CategoryLiteSerializer
      attribute :articles do |entity, params|
        next unless params[:articles].present?
        
        articles = params[:articles].select { |x| x.category_id == entity.id }
        
        articles.map do |article|
          ArticleLiteSerializer.new(article).serializable_hash[:data][:attributes]
        end
      end
    end
  end
end