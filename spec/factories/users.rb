FactoryBot.define do
  factory :user do
    sequence(:name_code) { |n| "@tester#{n}" }
    nickname 'テスト太郎'
    sequence(:email) { Faker::Internet.email }
    password 'password'
    password_confirmation "password"

    factory :birthday do
      sequence(:birthday) { "1" + "9" + Faker::Number.between(50, 99).to_s + "/" + "0" + Faker::Number.between(1, 9).to_s}
    end

    factory :introduction do
      sequence(:introduction) { Faker::Lorem.characters(10..100) }
    end
  end
end
