class Card < ApplicationRecord
  # Relations Dependencies & Associations

  # Validations
  validates :suit, length: { minimum: 1, maximum: 45 }, presence: true, on: [:create, :update]
  validates :rank, length: { minimum: 1, maximum: 45 }, presence: true, on: [:create, :update]
  validates :suit_rank, presence: true, uniqueness: true, length: { minimum: 1, maximum: 45 }, format: { with: /[a-z]{1,}_[a-z]{1,}/ }, on: [:create, :update]
end
