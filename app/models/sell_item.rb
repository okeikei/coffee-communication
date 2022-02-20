class SellItem < ApplicationRecord
    attachment :image
    belongs_to :genre, optional: true
    belongs_to :customer
    has_many :relationships
end
