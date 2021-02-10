class Movie < ApplicationRecord
  has_many :stars
  has_many :reviews
  has_one :director
  has_one_attached :photo
  has_one_attached :video
  validates :title, presence: true, uniqueness: true
  validates :year, presence: true
  validates :genre, presence: true
  validates :summary, presence: true, length: { maximum: 1500 }
  validates :imdb_score, presence: true
  validates :catego, presence: true, inclusion: { in: ['movies', 'TV series'] }
  validates :origin, presence: true
  validates :languange, presence: true
end
