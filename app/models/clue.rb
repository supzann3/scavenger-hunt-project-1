class Clue < ActiveRecord::Base
  belongs_to :list
  belongs_to :game


  def submission_valid?(user_answer, user_location=nil)
    !!(answer_valid?(user_answer) && location_valid?(user_location))
  end

  private
  def answer_valid?(user_answer)
    !!(self.answer == user_answer)
  end

  def location_valid?(user_location=nil)
    true #CHANGE ME!!
  end


end
