class Game < ApplicationRecord
  # Relations Dependencies & Associations
  has_and_belongs_to_many :players
  has_many :decks

  # Validations
end
