class Brewery < ApplicationRecord
  validates :name, presence: true
  # associarion
  has_many :sakes
end
