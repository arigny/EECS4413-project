class PurchaseOrder < ApplicationRecord
    belongs_to :address
    has_many :po_items

    attr_accessor :credit_card_number
    validates :credit_card_number, presence: true
    validate :mock_credit_card_authentication

    validates :lname, :fname, :status, :address_id, presence: true

    private

    def mock_credit_card_authentication
        credit_card_digits = credit_card_number.gsub(/\D/, "")
        return errors.add(:credit_card_number, "is invalid") if credit_card_digits.length != 16

        most_recent_orders = PurchaseOrder.order("created_at DESC").limit(3).pluck(:status)
        denied_check = most_recent_orders.count("ORDERED") == 2

        if denied_check
            # errors.add(:credit_card_number, "transaction failed")
            self.status = "DENIED"
        else
            self.status = "ORDERED"
        end
    end
end
