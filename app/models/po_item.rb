class PoItem < ApplicationRecord
    belongs_to :item
    belongs_to :purchase_order

    validates :bid, :price, presence: true
end
