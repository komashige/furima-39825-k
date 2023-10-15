class Ship < ApplicationRecord

  #validates :post_code,           presence: { message: "can't be blank" }, format: { with: /\A\d{3}-\d{4}\z/, message: "input correctly" }
  #validates :ship_area_id, numericality: { other_than: 1, message: "select" }
  #validates :city,                presence: { message: "can't be blank" }
  #validates :street_address,      presence: { message: "can't be blank" }
  #validates :telephone_number,    presence: { message: "can't be blank" }, format: { with: /\A\d{10,11}\z/, message: "input only number" }
  
  belongs_to :buy

end
