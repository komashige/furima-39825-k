class BuyForm 
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :ship_area_id, :city, :street_address, :telephone_number, :building_name, :token

  with_options presence: true do
    validates :token 
    validates :post_code,           presence: { message: "can't be blank" }, format: { with: /\A\d{3}-\d{4}\z/, message: "input correctly" }
    validates :ship_area_id, numericality: { other_than: 1, message: "select" }
    validates :city,                presence: { message: "can't be blank" }
    validates :street_address,      presence: { message: "can't be blank" }
    validates :telephone_number, presence: { message: "can't be blank" }, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number" }
  end
  validates :user_id, presence: true
  validates :item_id, presence: true

  def save
    return false unless valid?

    buy = Buy.create(user_id: user_id, item_id: item_id)
    
    Ship.create(
      post_code: post_code,
      ship_area_id: ship_area_id,
      city: city,
      street_address: street_address,
      telephone_number: telephone_number,
      building_name: building_name,
      buy_id: buy.id
    )
  end
end