FactoryBot.define do
  factory :post do
    title { FFaker::Lorem.sentence }
    description { FFaker::Lorem.paragraph }
  end
end
