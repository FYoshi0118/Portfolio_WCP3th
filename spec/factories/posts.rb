FactoryBot.define do
  factory :post do
    content "この内容はテスト"

    association :user
    # association :sake
  end
end
