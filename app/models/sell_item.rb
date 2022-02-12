class SellItem < ApplicationRecord
    belongs_to :customer
    belongs_to :relationship
end
