class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :winner
      t.integer :list_id

      t.timestamps null: false
    end
  end
end
