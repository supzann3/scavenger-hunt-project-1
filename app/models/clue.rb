class Clue < ActiveRecord::Base
  belongs_to :list
  belongs_to :game
end
