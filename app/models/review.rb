class Review < ApplicationRecord
  belongs_to :item

  validates :rating, inclusion: {:in => 1..5}
  validates :rating, :comment, presence: true
end
