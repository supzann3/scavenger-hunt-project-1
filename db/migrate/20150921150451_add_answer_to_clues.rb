class AddAnswerToClues < ActiveRecord::Migration
  def change
    add_column :clues, :answer, :string
  end
end
