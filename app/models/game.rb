class Game < ActiveRecord::Base
  has_many :game_users
  has_many :users, through: :game_users
  belongs_to :list
  has_many :clues, through: :list

end
