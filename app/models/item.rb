class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  

  belongs_to :user
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to :condition
  belongs_to :ship_cost
  belongs_to :ship_area
  belongs_to :ship_day

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "category can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "condition can't be blank" }
  validates :ship_cost_id, numericality: { other_than: 1, message: "ship_cost can't be blank" }
  validates :ship_area_id, numericality: { other_than: 1, message: "ship_area can't be blank" }
  validates :ship_day_id, numericality: { other_than: 1, message: "ship_day can't be blank" }
  validates :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :price, numericality: { only_integer: true, message: " is invalid. Input half-width characters"}
end
