class Item < ApplicationRecord
  has_many :visit_events
  
  validates :bid, :name, :description, :category, :brand, :quantity, :price, :colour, :size, :weight, presence: true
end
