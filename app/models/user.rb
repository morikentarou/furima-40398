class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchase

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[0-9])[a-z0-9]+\z/i
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々ー]+\z/
  VALID_KANA_REGEX = /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/
  validates :nickname,           presence: true
  validates :password,           format: { with: VALID_PASSWORD_REGEX }
  validates :last_name,          presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name,         presence: true, format: { with: VALID_NAME_REGEX }
  validates :reading_last_name,  presence: true, format: { with: VALID_KANA_REGEX }
  validates :reading_first_name, presence: true, format: { with: VALID_KANA_REGEX }
  validates :birthday,           presence: true
end
