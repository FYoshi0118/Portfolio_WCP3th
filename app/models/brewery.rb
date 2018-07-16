class Brewery < ApplicationRecord
  has_many :sakes
  # has_many :posts, through: :sakes
  # accepts_nested_attributes_for :sakes

  validates :name, presence: true
  validates :post_code,
    format: { 
      with: /\A\d{7}\z/, # 半角数字7桁のみ入力可能
      allow_blank: true,
      message: "半角数字7桁で入力して下さい。例：1234567" 
    }
end
