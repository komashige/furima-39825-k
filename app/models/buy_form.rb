class BuyForm 
  include ActiveModel::Model
  attr_accessor :image, :name, :description, :category_id, :condition_id, :ship_cost_id, :ship_area_id, :ship_day_id, :price, :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date, :email, :password

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_cost_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true, message: "is invalid. Input half-width characters" }

  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
  validates :birth_date, presence: true
  validates_format_of :email, with: Devise.email_regexp

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  def save
    return false unless valid? 

    ActiveRecord::Base.transaction do
      user = User.create!(
        nickname: nickname,
        first_name: first_name,
        last_name: last_name,
        first_name_kana: first_name_kana,
        last_name_kana: last_name_kana,
        birth_date: birth_date,
        email: email,
        password: password
      )

      Item.create!(
        user_id: user.id,  # 作成したUserのIDを使用
        image: image,
        name: name,
        description: description,
        category_id: category_id,
        condition_id: condition_id,
        ship_cost_id: ship_cost_id,
        ship_area_id: ship_area_id,
        ship_day_id: ship_day_id,
        price: price
      )
    end
  
    true  # 成功した場合
  rescue => e
    false # 何らかの理由で保存に失敗した場合
  end
end