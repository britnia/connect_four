class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :player
      t.text :board
      t.boolean :won

      t.timestamps
    end
  end
end
