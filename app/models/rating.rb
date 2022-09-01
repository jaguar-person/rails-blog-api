class Rating < ApplicationRecord
  validates :value, presence: true, comparison: { greater_than: 0, less_than_or_equal_to: 5 }

  belongs_to :post
  belongs_to :user
end
