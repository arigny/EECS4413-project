class PoItem < ApplicationRecord
    validates :bid, :quantity, :colour, :size, presence: true
end
