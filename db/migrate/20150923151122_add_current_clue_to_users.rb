class AddCurrentClueToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_clue, :integer
  end
end
