class Sake < ApplicationRecord
  belongs_to :brewery
  has_many :posts

  validates :brand, presence: true
  validates :flavor, inclusion: { in: [nil, '燻酒', '爽酒', '熟酒', '醇酒'] }

  def amakarado(nihonshudo, acidity)
    num = (193593 / (1443 + nihonshudo) ) - (1.16 * acidity) - 132.57
    return sprintf("%.2f", num)
  end
end
