class Item < ApplicationRecord
  belongs_to :buy
  belongs_to :user
  has_one_attached :image
end
