class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  
  has_many :orders
  
  has_many :cart_items
  
  has_many :addresses
  
  has_many :items
  
  has_many :item_commetns
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :customer
  
  def customer_infomation
    self.postal_code + self.address + self.last_name + self.first_name
    #データ型変更の場合はto_iやto_sを使用
  end
  
  def full_name
    self.last_name +  self.first_name
    #データ型変更の場合はto_iやto_sを使用
  end
  
  def full_name_kana
    self.last_name_kana +  self.first_name_kana
    #データ型変更の場合はto_iやto_sを使用
  end
  
  def full_address
     postal_code + address
  end
  
  def follow(other_customer)
    unless self == other_customer
      self.relationships.find_or_create_by(follow_id: other_customer.id)
    end
  end

  def unfollow(other_customer)
    relationship = self.relationships.find_by(follow_id: other_customer.id)
    relationship.destroy if relationship
  end

  def following?(other_customer)
    self.followings.include?(other_customer)
  end
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  
end
