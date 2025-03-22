require 'rails_helper'

RSpec.describe Abizvn::Cms::CategoryArticlesSerializer, type: :serializer do
  describe "serialization" do
    context 'order validations' do
      let!(:category1) { FactoryBot.create(:category) }
      let!(:article1) { FactoryBot.create(:article, category: category1) }
      let!(:article2) { FactoryBot.create(:article, category: category1) }
      let!(:serializer) { described_class.new(category1, params: { articles: [article1, article2] }) }
    
      it 'returns required attributes' do
        data = serializer.serializable_hash[:data]
        validate_category_articles_serialized_data(category1, data)
      end
    end
  end
end