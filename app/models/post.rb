class Post < ApplicationRecord
  belongs_to :user
  belongs_to :forum
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :title, length: { in: 3..60 }
  validates :content, presence: true
  validates :content, uniqueness: true
  validates :content, length: { in: 10..500 }
end
