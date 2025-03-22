FactoryBot.define do
  factory :video, class: 'Abizvn::Media::Video' do
    video { Rack::Test::UploadedFile.new(Rails.root.join('files', 'sample-5s.mp4'), 'video/mp4') }
    sequence(:description) { |n| "Description of Video #{n}" }

    trait :linked_video do
      link { 'https://file-examples.com/wp-content/storage/2017/04/file_example_MP4_480_1_5MG.mp4' }
      sequence(:description) { |n| "Description linked video #{n}" }
    end
  end
end