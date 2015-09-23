class FixColumnName2 < ActiveRecord::Migration
  def change
    rename_column :users, :current_clue, :clue_id
  end
end
