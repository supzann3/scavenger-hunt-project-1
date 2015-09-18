class CreateClues < ActiveRecord::Migration
  def change
    create_table :clues do |t|
      t.integer :list_id
      t.decimal :latitude
      t.decimal :longitude
      t.string :text
      t.string :hint

      t.timestamps null: false
    end
  end
end
