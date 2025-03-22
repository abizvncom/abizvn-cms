FactoryBot.define do
  factory :category, class: 'Abizvn::Cms::Category' do
    tag { 'sample' }
    
    association :general, factory: :general_setting
  end
end