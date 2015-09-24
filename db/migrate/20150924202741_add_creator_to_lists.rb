class AddCreatorToLists < ActiveRecord::Migration
  def change
    add_column :lists, :creator, :integer
  end
end
