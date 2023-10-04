class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birth_date, presence: true
  validates_format_of :email, with: Devise.email_regexp
  

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  VALID_NAME_REGEX = /\A[\p{Hiragana}\p{Katakana}\p{Han}ー－]+\z/.freeze
  validates :first_name, :last_name, format: { with: VALID_NAME_REGEX }

  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :first_name_kana, :last_name_kana, format: { with: VALID_KANA_REGEX }

end
