FactoryBot.define do
  factory :user do
    email { "user@test.com" }
    name { "User Test" }
    password { "123456" }
    nickname { "user" }
  end
end