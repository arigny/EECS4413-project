class Item < ApplicationRecord
  has_many :visit_events
  has_many :po_items
  
  validates :bid, :name, :description, :category, :brand, :quantity, :price, :colour, :size, :weight, presence: true
end
