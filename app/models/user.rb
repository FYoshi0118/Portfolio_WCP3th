class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :sakes, through: :sakes
    
  validates :nickname, presence: true

  validates :birthday,
    format: {
      with: /\A[1-2]\d{3}\/0[1-9]\z|\A[1-2]\d{3}\/1[0-2]\z/, # YYYY/01～YYYY/12まで
      allow_blank: true,
      message: "YYYY/MMの形式（半角数字）で入力して下さい。"
    }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true,
    format: {
      with: VALID_EMAIL_REGEX, 
      message: "記入内容を確認して下さい。"
    }

  validates :password, presence: true,
                       on: :create,
    length: {
      in: 6..20,
      message: "6～20文字以内で入力して下さい。"
    }
  validates :password, presence: true,
                       on: :update,
                       allow_blank: true,
    length: {
      in: 6..20,
      message: "6～20文字以内で入力して下さい。"
    }

  validates :introduction,
  length: {
    maximum: 200,
    message: "200文字以下で入力して下さい。"
  }

  validates :status, presence: true
end
