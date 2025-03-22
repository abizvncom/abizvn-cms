module Abizvn
  module Cms
    module CmsValidationHelpers
      def validate_category_articles_serialized_data(category, serialized_data)
        expect(serialized_data).to have_key(:id)
        expect(serialized_data).to have_key(:type)
        expect(serialized_data).to have_key(:attributes)

        expect(serialized_data[:id]).to eq(category.id.to_s)
        expect(serialized_data[:type]).to eq(:category_articles)
        validate_category_articles_data_attributes(category, serialized_data[:attributes])
      end

      def validate_category_articles_data_attributes(category, data_attributes)
        validate_category_lite_data_attributes(category, data_attributes)

        expect(data_attributes).to have_key(:articles)
        expect(data_attributes[:articles].size).to eq(category.articles.size)
        
        category.articles.each do |article|
          article_data = data_attributes[:articles].find { |x| x[:id] == (article.slug || article.id) }
          validate_article_lite_data_attributes(article, article_data)
        end
      end


      def validate_category_lite_serialized_data(category, serialized_data)
        expect(serialized_data).to have_key(:id)
        expect(serialized_data).to have_key(:type)
        expect(serialized_data).to have_key(:attributes)

        expect(serialized_data[:id]).to eq(category.id.to_s)
        expect(serialized_data[:type]).to eq(:category_lite)
        validate_category_lite_data_attributes(category, serialized_data[:attributes])
      end

      def validate_category_lite_data_attributes(category, data_attributes)
        expect(data_attributes).to have_key(:id)
        expect(data_attributes).to have_key(:code)
        expect(data_attributes).to have_key(:value)

        expect(data_attributes[:id]).to eq(category.id)
        expect(data_attributes[:code]).to eq(category.general.code)
        expect(data_attributes[:value]).to eq(category.general.value)
      end


      def validate_article_lite_serialized_data(article, serialized_data)
        expect(serialized_data).to have_key(:id)
        expect(serialized_data).to have_key(:type)
        expect(serialized_data).to have_key(:attributes)
      
        expect(serialized_data[:id]).to eq(article.id.to_s)
        expect(serialized_data[:type]).to eq(:article_lite)
        validate_article_lite_data_attributes(article, serialized_data[:attributes])
      end

      def validate_article_lite_data_attributes(article, data_attributes)
        expect(data_attributes).to have_key(:id)
        expect(data_attributes).to have_key(:title)
        expect(data_attributes).to have_key(:updated_at)

        expect(data_attributes[:id]).to eq(article.slug || article.id)
        expect(data_attributes[:title]).to eq(article.title)
        expect(data_attributes[:updated_at]).to eq(article.updated_at)
      end


      def validate_article_serialized_data(article, serialized_data)
        expect(serialized_data).to have_key(:id)
        expect(serialized_data).to have_key(:type)
        expect(serialized_data).to have_key(:attributes)
       
        expect(serialized_data[:id]).to eq(article.id.to_s)
        expect(serialized_data[:type]).to eq(:article)
        validate_article_data_attributes(article, serialized_data[:attributes])
      end

      def validate_article_data_attributes(article, data_attributes)
        validate_article_lite_data_attributes(article, data_attributes)

        expect(data_attributes).to have_key(:description)
        expect(data_attributes).to have_key(:created_at)
        expect(data_attributes[:description]).to eq(article.description)
        expect(data_attributes[:created_at]).to eq(article.created_at)
      end
    end
  end
end