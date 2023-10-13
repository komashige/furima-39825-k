class Buy < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :ship

  #validates :user,null: false, foreign_key: true
  #validates :item,null: false, foreign_key: true
end
