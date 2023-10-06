class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :buy
  belongs_to :user
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to :condition
  belongs_to :ship_cost
  belongs_to :ship_area
  belongs_to :ship_day
end
