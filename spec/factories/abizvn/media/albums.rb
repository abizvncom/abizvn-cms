FactoryBot.define do
  factory :album, class: 'Abizvn::Media::Album' do
    sequence(:title) { |n| "Album #{n}" }
    sequence(:description) { |n| "Description of album #{n}" }

    association :status, factory: :general_setting
  end
end