class Item < ApplicationRecord
    
  attachment :image
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  has_many :cart_items
  has_many :item_comments
  belongs_to :customer
  belongs_to :genre
  has_many :relationships
  has_many :order_details
  
  enum is_active: { 販売中: true, 販売停止中: false}
  #tinyint → 1桁の数値を定義できる
  
  def with_tax_price
    (price * 1.1).floor
  end
  
  def favorited_by?(customer)
    favorites.where(item_id: id).where(customer_id: customer.id).exists?
  end
  

end
