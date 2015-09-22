
class Clue < ActiveRecord::Base
  belongs_to :list
  belongs_to :game


  def submission_valid?(user_answer, user_location=nil)
    !!(answer_valid?(user_answer) && location_valid?(user_location))
  end

  def location_valid?(user_location=nil)
    clue_location = [latitude, longitude]
    distance = Geocoder::Calculations.distance_between(user_location, clue_location) * 5280
    if distance <= 65 
      return true
    else
      return false
    end
  end

  private
  def answer_valid?(user_answer)
    !!(self.answer == user_answer)
  end




end