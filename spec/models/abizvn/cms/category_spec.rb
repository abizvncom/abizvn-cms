require 'rails_helper'

RSpec.describe Abizvn::Cms::Category, type: :model do
  describe 'associations' do
    it { should belong_to(:general).class_name('Abizvn::General::GeneralSetting') }
    it { should have_many(:articles).with_foreign_key(:category_id) }
  end

  describe 'table name' do
    it 'sets the correct table name' do
      expect(Abizvn::Cms::Category.table_name).to eq('cms_categories')
    end
  end
  
  describe 'RansackSearchable' do
    it 'includes Commonbase::RansackSearchable' do
      expect(Abizvn::Cms::Category.ancestors).to include(Commonbase::RansackSearchable)
    end
  end

  describe 'methods' do
    context 'count articles' do
      let(:category) { FactoryBot.create(:category) }
      let(:status) { FactoryBot.create(:general_setting) }

      before do
        Abizvn::Cms::Article.create(category: category, status: status, title: 'Article 1', description: 'Desc')
        Abizvn::Cms::Article.create(category: category, status: status, title: 'Article 2', description: 'Desc')
      end

      it 'returns correct value for articles_count' do
        expect(category.articles.count).to eq(2)
        expect(category.articles_count).to eq(2)
      end
    end
  end
end