class Item < ApplicationRecord
    
  attachment :image
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  has_many :cart_items
  has_many :item_commetns
  belongs_to :customer
  belongs_to :genre
  belongs_to :relationship
  has_many :order_details
  
  enum is_active: { 販売中: true, 販売停止中: false}
  
  
  def with_tax_price
    (price * 1.1).floor
  end
  
  def favorited_by?(item)
    favorites.where(item_id: item.id).exists?
  end
  

end
