class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{6,}\z/
  VALID_KANA_REGEX = /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/
  validates :nickname,           presence: true
  validates :email,              format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }, confirmation: true
  validates :last_name,          presence: true
  validates :first_name,         presence: true
  validates :reading_last_name,  presence: true, format: { with: VALID_KANA_REGEX }
  validates :reading_first_name, presence: true, format: { with: VALID_KANA_REGEX }
  validates :birthday,           presence: true
end
