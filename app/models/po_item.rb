class PoItem < ApplicationRecord
    belongs_to :item
    belongs_to :purchase_order, optional: true

    validates :bid, :name, :price, :quantity, presence: true
end
