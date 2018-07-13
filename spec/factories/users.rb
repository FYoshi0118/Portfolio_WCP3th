FactoryBot.define do
  factory :user do
    sequence(:name_code) { |n| "@tester#{n}" }
    nickname 'テスト太郎'
    sequence(:email) { Faker::Internet.email }
    password 'password'
  end
end
