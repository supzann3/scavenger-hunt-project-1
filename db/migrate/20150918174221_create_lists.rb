class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.string :location

      t.timestamps null: false
    end
  end
end
