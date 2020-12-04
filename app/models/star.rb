class Star < ApplicationRecord
  belongs_to :movie
  has_one_attached :photo
  validates :fullname, presence: true
  validates :birthyear, presence: true
  validates :minibio, presence: true
  validates :nationality, presence: true
  validates :top_movies, presence: true
  validates :height, presence: true, allow_nil: false
end
