class Item < ApplicationRecord
  validates :bid, :name, :description, :category, :brand, :quantity, :price, :colour, :size, :weight, presence: true
end
