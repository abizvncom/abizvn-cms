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
end