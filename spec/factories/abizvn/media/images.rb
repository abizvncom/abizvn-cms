FactoryBot.define do
  factory :image, class: 'Abizvn::Media::Image' do
    image { Rack::Test::UploadedFile.new(Rails.root.join('files', 'small.png'), 'image/png') }
    sequence(:description) { |n| "Description of image #{n}" }

    trait :linked_image do
      link { 'https://file-examples.com/wp-content/storage/2017/10/file_example_PNG_3MB.png' }
      sequence(:description) { |n| "Description of large image #{n}" }
    end
  end
end