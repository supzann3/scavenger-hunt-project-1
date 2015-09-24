class ListsController < ApplicationController
  def index
    @lists = List.all
    if !!(current_user.current_clue_id)
      redirect_to "/lists/#{current_user.clue.list_id}/clues/#{current_user.current_clue_id}"
    end
  end

  def new
    @list=List.new
  end

  def create
    @list=List.create(name: params[:name], location: params[:location], creator: current_user.id)
    redirect_to "/lists/#{@list.id}/clues/new"
  end

  def show
    @list=List.find(params[:id])
  end
end
