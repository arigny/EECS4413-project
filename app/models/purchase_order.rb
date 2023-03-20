class PurchaseOrder < ApplicationRecord
    validates :bid, presence: true
end
