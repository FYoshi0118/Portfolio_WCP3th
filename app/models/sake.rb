class Sake < ApplicationRecord
  belongs_to :brewery, optional: true
  has_many :posts
  accepts_nested_attributes_for :posts
  has_many :users, through: :users

  validates :brand, presence: true
  validates :flavor, inclusion: { in: [nil, '燻酒', '爽酒', '熟酒', '醇酒'] }

  def amakarado(nihonshudo, acidity)
    num = (193593 / (1443 + nihonshudo) ) - (1.16 * acidity) - 132.57
    return sprintf("%.2f", num)
  end
end
