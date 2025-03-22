require 'rails_helper'

RSpec.describe Abizvn::Cms::Category, type: :model do
  describe 'associations' do
    it { should belong_to(:general).class_name('Abizvn::General::GeneralSetting') }
    it { should have_many(:articles).with_foreign_key(:category_id) }
  end
  
  # describe "validations" do
  #   it { should validate_presence_of(:group) }
  # end
end