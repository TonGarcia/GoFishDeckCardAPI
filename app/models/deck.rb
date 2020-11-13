class Deck < ApplicationRecord
  # Relations Dependencies & Associations
  belongs_to :card
  belongs_to :game
  belongs_to :player

  # Validations
  validates :card_id, presence: true, on: [:create, :update]
  validates :game_id, presence: true, on: [:create, :update]
  validates :player_id, presence: true, on: [:create, :update]
end
