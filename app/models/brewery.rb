class Brewery < ApplicationRecord
  has_many :sakes
  # accepts_nested_attributes_for :sakes

  validates :name, presence: true
  validates :name_kana, presence: true
  validates :post_code, presence: true,
    format: { 
      with: /\A\d{7}\z/, # 半角数字7桁のみ入力可能
      message: "半角数字7桁で入力して下さい。例：1234567" 
    }
  validates :address, presence: true
end
