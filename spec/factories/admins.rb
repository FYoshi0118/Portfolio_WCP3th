FactoryBot.define do
  factory :admin do
    family_name 'テスト'
    given_name '太郎'
    sequence(:email) { |n| "tester#{n}@wcp.com" }
    password 'password'
  end
end
