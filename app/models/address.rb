class Address < ApplicationRecord
  has_many :purchase_orders

  validates :street, :province, :country, :zip, presence: true
end

