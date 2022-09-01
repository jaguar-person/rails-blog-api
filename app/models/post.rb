class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :ip, presence: true

  has_many :ratings, dependent: :restrict_with_exception
  belongs_to :user
  has_one :user
end
