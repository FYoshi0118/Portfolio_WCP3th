FactoryBot.define do
  factory :sake do
    brand '獺祭'
    
    # association :post
    association :brewery
  end
end
