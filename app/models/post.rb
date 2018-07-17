class Post < ApplicationRecord
  belongs_to :sake, optional: true
  belongs_to :user, optional: true, counter_cache: true

  validates :content, presence: true, length: { maximum: 200}
  validates :star, presence: true
end
