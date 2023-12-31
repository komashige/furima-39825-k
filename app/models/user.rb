class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} 
  validates :last_name, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} 
  validates :first_name_kana, presence: true,format: { with: /\A[ァ-ヶー]+\z/ } 
  validates :last_name_kana, presence: true,format: { with: /\A[ァ-ヶー]+\z/ } 
  validates :birth_date, presence: true
  validates_format_of :email, with: Devise.email_regexp
  

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  has_many :items
  has_many :buys

end
