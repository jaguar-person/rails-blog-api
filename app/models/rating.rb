class Rating < ApplicationRecord
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :value, presence: true

  belongs_to :post
  belongs_to :user
end
