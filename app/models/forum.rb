class Forum < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :title, presence: true
  validates :title, length: { in: 1..50 }
  validates :title, uniqueness: true
  validates :description, presence: true
  validates :description, uniqueness: true
  validates :description, length: { in: 30..200 }
end
