class GamesPlayers < ActiveRecord::Migration[6.0]
  def change
    # If you want to add an index for faster querying through this join:
    create_join_table :games, :players do |t|
      t.index :game_id
      t.index :player_id
    end
  end
end
