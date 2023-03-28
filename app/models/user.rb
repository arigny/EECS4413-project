class User < ApplicationRecord
  belongs_to :address

  validates :email, :password, :address_id, presence: true
  validates :email, uniqueness: true
end
