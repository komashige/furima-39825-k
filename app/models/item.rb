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
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :ship_cost_id, presence: true
  validates :ship_area_id, presence: true
  validates :ship_day_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
