class Post < ApplicationRecord
  attachment :image

  belongs_to :sake, optional: true
  belongs_to :user, optional: true, counter_cache: true

  validates :content, length: {maximum: 200}
  validates :star, presence: true,
                   length: {
                     minimum: 0, maximum: 5,
                     message: "星評価に変える"
                   }
end
