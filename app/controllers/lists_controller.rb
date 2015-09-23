class ListsController < ApplicationController
  def index
    @lists = List.all
  end
  def new
    @list=List.new
  end
  def create
    @list=List.create(name: params[:name], user_id: current_user.id, location: params[:location])
    redirect_to "/lists/#{@list.id}/clues/new"
  end
  def show
    @list=List.find(params[:id])
  end
end
