class Clue < ActiveRecord::Base
  belongs_to :list
  belongs_to :game
  has_many :users

  def next_clue
    self.list.clues[self.list.clues.index(self) + 1]
  end

  def last_clue?
    self == self.list.clues.last ? true : false
  end

  def submission_valid?(user_answer, user_location=nil)
    !!(answer_valid?(user_answer) && location_valid?(user_location))
  end

  def location_valid?(user_location=nil)
    return true
    # clue_location = [latitude, longitude]
    # distance = Geocoder::Calculations.distance_between(user_location, clue_location) * 5280
    # distance <= 65 ? true : false
  end

  def answer_valid?(user_answer)
    word_match = FuzzyStringMatch::JaroWinkler.create( :pure )
    if word_match.getDistance("#{self.answer}".downcase, "#{user_answer}".downcase) > 0.55
      return true
    else
      return false
    end
  end

end
