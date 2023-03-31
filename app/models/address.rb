class Address < ApplicationRecord
  has_many :purchase_orders
  has_many :users

  validates :street, :province, :country, :zip, presence: true
end

