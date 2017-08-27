class Film < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :premiere, presence: true, length: { minimum: 5 }
  validates :length, presence: true, length: { minimum: 2 }
  validates :country, presence: true, length: { minimum: 2 }
  validates :director, presence: true, length: { minimum: 5 }
  validates :screen_writer, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :category, presence: true, length: { minimum: 5 }

  has_many :opinions

  def next_film
    Film.where("title > ?", title).order(:title).first
  end

  def previous_film
    Film.where("title < ?", title).order(:title).last
  end
end
