class CluesController < ApplicationController
  respond_to :js

  def index
  end

  def show
    @clue = Clue.find(params[:id])
  end

  def validate
    @clue = Clue.find(params[:clue_id])
    user_answer = params[:answer]
    user_location = [params[:latitude], params[:longitude]]
    if @clue.submission_valid?(user_answer, user_location)

      @clue = Clue.find(params[:clue_id].to_i + 1)
      respond_to do |format|
        # binding.pry
        # format.html
        format.html {render :layout => false}
      end
    end
    # render @clue
    # "/lists/#{params[:current_list_id].to_i}/clues/#{params[:clue_id].to_i + 1}"
    # redirect_to root_path
  end
  # def answer
  #   # binding.pry
  # end

end
