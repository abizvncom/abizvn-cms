FactoryBot.define do
  factory :general_setting, class: 'Abizvn::General::GeneralSetting' do
    group { "sample_group" }
    active { true }
    sequence(:code) { |n| "code#{n}" }
    sequence(:value) { |n| "Value #{n}" }
    sequence(:order) { |n| (100 + n) }
  end
end