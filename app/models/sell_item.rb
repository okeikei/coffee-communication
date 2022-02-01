class SellItem < ApplicationRecord
    
  attachment :image
  belongs_to :customer
  belongs_to :item
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
end
