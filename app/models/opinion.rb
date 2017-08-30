class Opinion < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5 }
  validates :surname, presence: true, length: { minimum: 5 }
  validates :text, presence: true, length: { minimum: 5 }
  validates :rate, presence: true, length: { minimum: 1 }

  belongs_to :film
end
