class BuyForm 
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :ship_area_id, :city, :street_address, :telephone_number, :building_name, :token

  with_options presence: { message: "can't be blank" } do
    validates :token 
    validates :post_code,            format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid" }
    validates :ship_area_id, numericality: { other_than: 1, message: "select" }
    validates :city                
    validates :street_address    
    validates :telephone_number,  format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number" }
    validates :user_id
    validates :item_id
  end

  

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