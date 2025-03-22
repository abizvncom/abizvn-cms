require 'rails_helper'

RSpec.describe Abizvn::Cms::ArticleSerializer, type: :serializer do
  describe "serialization" do
    context 'order validations' do
      let (:article1) { FactoryBot.create(:article) }
      let (:serializer) { described_class.new(article1) }
    
      it 'returns required attributes' do
        data = serializer.serializable_hash[:data]
        validate_article_serialized_data(article1, data)
      end
    end
  end
end