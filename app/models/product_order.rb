class ProductOrder < ApplicationRecord
    validates :bid, :quantity, :colour, :size, presence: true
  end
  