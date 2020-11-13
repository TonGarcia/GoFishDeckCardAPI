class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :suit
      t.string :rank
      t.string :suit_rank

      t.timestamps
    end

    add_index :cards, :suit_rank
  end
end
