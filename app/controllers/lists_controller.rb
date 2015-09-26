class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list=List.create(name: params[:name], location: params[:location], creator: current_user.id)
    redirect_to "/lists/#{@list.id}/edit"
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.name = params[:name]
    @list.location = params[:location]
    @list.save

    respond_to do |format|
      format.json { render json: @list.id }
    end
  end

  def show
    @list=List.find(params[:id])
  end
end
