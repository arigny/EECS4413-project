class PurchaseOrder < ApplicationRecord
    belongs_to :address
    has_many :po_items, dependent: :destroy
    after_create :destroy_po_items, if: -> { status == "ORDERED" }

    attr_accessor :credit_card_number
    validates :credit_card_number, presence: true, unless: :rails_console_is_seeding?
    validate :mock_credit_card_authentication, unless: :rails_console_is_seeding?

    validates :lname, :fname, :status, :address_id, presence: true

    private

    def mock_credit_card_authentication
        return errors.add(:credit_card_number, "is not present") if credit_card_number.nil?
    
        credit_card_digits = credit_card_number.gsub(/\D/, "")
        return errors.add(:credit_card_number, "is invalid") if credit_card_digits.length != 16
    
        most_recent_orders = PurchaseOrder.order("created_at DESC").limit(2).pluck(:status)
        denied_check = most_recent_orders.count("ORDERED") == 2
    
        if denied_check
            # errors.add(:credit_card_number, "transaction failed")
            self.status = "DENIED"
        else
            self.status = "ORDERED"
        end
    end

    def destroy_po_items
        po_items.destroy_all
    end
        
    def rails_console_is_seeding?
        Rails.const_defined?('Console') || (File.basename($0) == 'seed')
    end
end
