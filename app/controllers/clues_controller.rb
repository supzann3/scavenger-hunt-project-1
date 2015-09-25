class CluesController < ApplicationController
  respond_to :js

  def index
  end

  def new
    @list = List.find(params[:list_id])
    @clue = Clue.new
  end

  def create
    # binding.pry
    @clue = Clue.create({
      latitude: params["latitude"],
      longitude: params["longitude"],
      text: params["text"],
      answer: params["answer"],
      list_id: params["list_id"]
      })
    @list = List.find(params[:list_id])

    respond_to do |format|
      format.json { render json: @clue.id }
    end

  end

  def update
    @clue = Clue.find(params[:id])
    @clue.text = params[:text]
    @clue.answer = params[:answer]
    @clue.save

    respond_to do |format|
      format.json { render json: @clue.id }
    end
  end

  def destroy

    @clue = Clue.find(params[:id])
    @clue.destroy

    respond_to do |format|
      format.json { render json: @clue.id }
    end
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

  def new_from_address
    @list = List.find(params[:list_id])
  end

  def create_from_address
    # binding.pry
    address = params[:address][:street]
    city = params[:address][:city]
    state = params[:address][:state]
    zip = params[:address][:zip]

    @address = Address.new([address, city, state, zip])
    respond_to do |format|
      format.json { render json: @address.coordinates }
    end

    # if @address.geocoder_knows?
    #   binding.pry
    #   return @address.coordinates
    # end
  end

  private

  # @address = Address.new(["11 Broadway", "New York", "NY", "10004"])



end
