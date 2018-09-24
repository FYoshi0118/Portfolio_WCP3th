class Admin < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :family_name, presence: true
  validates :given_name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true,
    format: {
      with: VALID_EMAIL_REGEX, 
      message: '記入内容を確認して下さい。'
    }
    
  validates :password, length: { maximum: 20 }

  validates :is_main_administer, inclusion: { in: [true, false] }
  validates :is_deleted, inclusion: { in: [true, false] }
end
