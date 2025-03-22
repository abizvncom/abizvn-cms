require 'rails_helper'

RSpec.describe Abizvn::Cms::Article, type: :model do
  describe 'associations' do
    it { should belong_to(:status).class_name('Abizvn::General::GeneralSetting') }
    it { should belong_to(:category).class_name('Abizvn::Cms::Category').counter_cache(true) }
  end

  describe 'scopes' do
    describe '.ordered' do
      it 'orders articles by updated_at in descending order' do
        article1 = FactoryBot.create(:article, updated_at: 2.days.ago)
        article2 = FactoryBot.create(:article, updated_at: 1.day.ago)
        article3 = FactoryBot.create(:article, updated_at: Time.current)

        expect(Abizvn::Cms::Article.ordered).to eq([article3, article2, article1])
      end
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end

  describe 'table name' do
    it 'sets the correct table name' do
      expect(Abizvn::Cms::Article.table_name).to eq('cms_articles')
    end
  end

  describe 'RansackSearchable' do
    it 'includes Commonbase::RansackSearchable' do
      expect(Abizvn::Cms::Article.ancestors).to include(Commonbase::RansackSearchable)
    end
  end
end