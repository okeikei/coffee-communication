class CustomerReview < ApplicationRecord
    
    belongs_to :customer, optional: true

end
