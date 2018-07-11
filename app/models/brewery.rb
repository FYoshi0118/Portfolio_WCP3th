class Brewery < ApplicationRecord
  validates :name, presence: true
  validates :name_kana, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
  # associarion
  has_many :sakes
end
