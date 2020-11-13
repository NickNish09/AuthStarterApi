FactoryBot.define do
  factory :post do
    title { FFaker::Lorem.sentence }
    description { FFaker::Lorem.paragraph }
    published_at { Date.today }
    subtitle { FFaker::Lorem.sentence }
  end
end
