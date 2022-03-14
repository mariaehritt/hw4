class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params["id"])
  end

  def new
    @place = Place.new
  end

  def create
    if @current_user
      @place = Place.new(params["place"])
      @place.user_id = @current_user.id
      @place.save
    else
      flash[:notice] = "Login first."
    end
    redirect_to "/places"
  end

end
