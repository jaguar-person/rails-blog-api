class User < ApplicationRecord
  validates :login, presence: true

  has_many :posts, dependent: :restrict_with_exception
  has_many :ratings, dependent: :restrict_with_exception
end
