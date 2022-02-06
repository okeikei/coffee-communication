class ItemComment < ApplicationRecord
    
    belongs_to :item, optional: true
    belongs_to :customer, optional: true

end
