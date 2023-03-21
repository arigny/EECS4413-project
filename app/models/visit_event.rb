class VisitEvent < ApplicationRecord
  belongs_to :item

  validates :ipaddress, :day, :bid, :eventtype, presence: true  
end
