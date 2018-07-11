class Post < ApplicationRecord
  validates :user_id, presence: true
  validates :sake_id, presence: true
  validates :content, presence: true, length: { maximum: 200}
  validates :star, presence: true

  # association
  belongs_to :user
  belongs_to :sake
end
