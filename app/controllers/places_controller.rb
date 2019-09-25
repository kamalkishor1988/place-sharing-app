class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: :public_share
  def index
    @places = Place.where(":shared_id = ANY(shared_ids)", shared_id: current_user.id.to_s) + current_user.places
    @place_coordinates = find_coordinates(@places.select{ |place| place[:latitude].present? && place[:longitude].present? })
  end

  def new
  	@place = Place.new
  end

  def create
  	@place = Place.new(place_params)
    if @place.save
      flash[:success] = "Place added!"
      redirect_to places_path
    else
      render 'new'
    end
  end

  def show
  	@place = Place.find(params[:id])
  end

  def public_share
  	@username = params[:username]
  	begin
  	 user = User.find_by!(email: @username)
     @places = user.places.where.not(longitude: nil, latitude: nil, public: false)
     @place_coordinates = find_coordinates(@places)
	  rescue ActiveRecord::RecordNotFound
	    redirect_to root_path
	    return
	  end
  end

  private

  def find_coordinates(places)
    places.pluck(:longitude, :latitude)
  end

  def place_params
    params.require(:place).permit(:title, :address, :user_id, :public, shared_ids: [])
  end
end
