class PurchaseOrder < ApplicationRecord
    belongs_to :address
    has_many :po_items

    validates :lname, :fname, :status, :address_id, presence: true
end
