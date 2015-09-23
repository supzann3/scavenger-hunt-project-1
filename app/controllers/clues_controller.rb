class CluesController < ApplicationController
  respond_to :js

  def index
  end

  def new
    @list = List.find(params[:list_id])
    @clue = Clue.new
  end

  def create
    @clue = Clue.create({
      latitude: params["latitude"],
      longitude: params["longitude"],
      text: params["text"],
      answer: params["answer"],
      list_id: params["list_id"]
      })
    @list = List.find(params[:list_id])
    redirect_to new_list_clue_path
  end

  def show
    # @list=List.find(params[:list_id])
    @clue = Clue.find(params[:id])
    current_user.clue_id = @clue.id
    current_user.save
  end

  def validate
    @clue = Clue.find(params[:id])
    user_answer = params[:answer]
    user_location = [params[:latitude], params[:longitude]]
    if params[:reset_clue_id] == "true"
      current_user.clue_id = nil
      current_user.save
      redirect_to root_path
    elsif @clue.submission_valid?(user_answer, user_location)
      if @clue.last_clue?
        flash[:notice] = "You win! Play again?"
        current_user.clue_id = nil
        current_user.save
        redirect_to root_path
      else
        @clue = @clue.next_clue
        redirect_to "/lists/#{@clue.list.id}/clues/#{@clue.id}"
      end
    else
      flash[:alert] = "Wrong answer, try again!"
      @clue = Clue.find(params[:id])
      redirect_to "/lists/#{@clue.list.id}/clues/#{@clue.id}"
    end
  end

  private



end
