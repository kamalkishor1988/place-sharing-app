class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: :public_share
  def index
  	places = Place.order('created_at DESC')
  	@places = ( places.select {
  	 |place| place.shared_ids.include? current_user.id.to_s
  	} << current_user.places ).flatten.uniq
  	@place_coordinates = @places.select {
  		|x| x.longitude.present? && x.latitude.present?
  	}.map{|y| [y.longitude, y.latitude]}
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
       @places = user.places.select { |place| place.public == true }
       @place_coordinates = @places.select {
    	  |x| x.longitude.present? && x.latitude.present?
    	 }.map{|y| [y.longitude, y.latitude]}
	  rescue ActiveRecord::RecordNotFound
	    redirect_to root_path
	    return
	  end
  end

  private

  def place_params
    params.require(:place).permit(:title, :address, :user_id, :public, shared_ids: [])
  end
end
