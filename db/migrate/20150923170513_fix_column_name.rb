class FixColumnName < ActiveRecord::Migration
  def change
    def change
      rename_column :users, :current_clue, :clue_id
    end
  end
end
