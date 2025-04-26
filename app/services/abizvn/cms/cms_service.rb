module Abizvn
  module Cms
    class CmsService
      STATUS_PUBLIC = 'public'.freeze
      
      STATUS_TABLE_NAME = GeneralSetting.table_name
      ARTICLE_TABLE_NAME = Article.table_name
  
      def self.get_articles_by_status(status_codes, filter_options)
        category_id = filter_options[:category_id]
        article_id = filter_options[:article_id]
    
        query = Article.joins(:status).where("#{STATUS_TABLE_NAME}.code": status_codes).ordered
        
        if category_id.present?
          query = query.where(category_id: category_id)
        elsif article_id.present?
          query = query.where(category_id: Article.select(:category_id).where(slug: article_id))
        end
    
        return query
      end
    
      def self.find_article(id, status_code)
        Article.joins(:status, :category).includes(:category).where("#{STATUS_TABLE_NAME}.code": status_code).friendly.find(id)
      end

      def self.get_categories_with_latest_articles(category_tag = nil, nb_articles = 5)
        subquery = Article.joins(:status, :category)
                    .select("#{ARTICLE_TABLE_NAME}.*, ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY #{ARTICLE_TABLE_NAME}.updated_at DESC) as row_num")
                    .where("#{STATUS_TABLE_NAME}.code": STATUS_PUBLIC)
                    .to_sql
    
        articles = Article.select('*')
                    .from("(#{subquery}) as articles_with_row_numbers")
                    .where('row_num <= ?', nb_articles)
                    .includes(:category)

        if category_tag.present?
          articles = articles.where("#{Category.table_name}.tag": category_tag)
        end
    
        categories = articles.map(&:category).uniq.sort { |c| c.order }
        
        return [categories, articles]
      end
    end
  end
end
