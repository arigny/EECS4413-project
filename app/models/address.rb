class Address < ApplicationRecord
  validates :street, :province, :country, :zip, presence: true
end

