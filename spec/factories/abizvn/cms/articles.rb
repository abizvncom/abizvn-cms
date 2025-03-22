FactoryBot.define do
  factory :article, class: 'Abizvn::Cms::Article' do
    sequence(:title) { |n| "Title of article #{n}" }
    sequence(:description) { |n| "Description of article #{n}" }

    association :status, factory: :general_setting
    association :category, factory: :category
  end
end