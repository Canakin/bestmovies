class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :content, presence: true, length: { maximum: 1500 }
  validates :rating, presence: true
end
