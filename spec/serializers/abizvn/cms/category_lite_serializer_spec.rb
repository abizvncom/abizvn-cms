require 'rails_helper'

RSpec.describe Abizvn::Cms::CategoryLiteSerializer, type: :serializer do
  describe "serialization" do
    context 'order validations' do
      let (:category1) { FactoryBot.create(:category) }
      let (:serializer) { described_class.new(category1) }
    
      it 'returns required attributes' do
        data = serializer.serializable_hash[:data]
        validate_category_lite_serialized_data(category1, data)
      end
    end
  end
end