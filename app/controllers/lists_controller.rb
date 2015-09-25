class ListsController < ApplicationController
  def index
    @lists = List.all
    # if !!(current_user.clue)
    #   redirect_to "/lists/#{current_user.clue.list_id}/clues/#{current_user.clue_id}"
    # end
  end

  def new
    @list = List.new
  end

  def create
    @list=List.create(name: params[:name], location: params[:location], creator: current_user.id)
    redirect_to "/lists/#{@list.id}/clues/new"
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
  end

  def show
    @list=List.find(params[:id])
  end
end
