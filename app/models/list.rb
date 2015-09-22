class List < ActiveRecord::Base
  has_many :clues
  has_many :games

end
