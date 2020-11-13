class Player < ApplicationRecord
  # Relations Dependencies & Associations
  has_many :decks
  has_and_belongs_to_many :games

  # Validations
  validates :name, presence: true, uniqueness: true, length: { minimum: 1, maximum: 45 }, format: { with: /[a-z]{1,}/ }, on: [:create, :update]
end
