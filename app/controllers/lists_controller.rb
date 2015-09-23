class ListsController < ApplicationController
  def index
    @lists = List.all
    if !!(current_user.clue_id)
      redirect_to "/lists/#{current_user.clue.list_id}/clues/#{current_user.clue_id}"
    end
  end

  def show
    @list=List.find(params[:id])
  end
end
