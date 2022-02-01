class Favorite < ApplicationRecord
    
  belongs_to :customer
  belongs_to :item
  belongs_to :sell_item
end
