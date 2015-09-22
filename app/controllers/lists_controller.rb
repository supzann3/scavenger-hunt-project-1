class ListsController < ApplicationController
  def index
    @lists = List.all
    # @lists.each do|list|
    #
    #   @list_id=list.id
    #   @id=list.clues.first.id
    # end
  end

  def show
    @list=List.find(params[:id])
  end
end
