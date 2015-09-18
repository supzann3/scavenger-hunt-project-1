class Clue < ActiveRecord::Base
  belongs_to :list 
  belongs_to :game, through: :list
end
