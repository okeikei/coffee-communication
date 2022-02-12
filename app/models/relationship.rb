class Relationship < ApplicationRecord
  belongs_to :customer
  belongs_to :follow, class_name: 'Customer'
  has_many :items
  has_many :sell_items
  validates :customer_id, presence: true
  validates :follow_id, presence: true
end
