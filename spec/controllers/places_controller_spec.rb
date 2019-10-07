require 'rails_helper'
require_relative '../support/devise'

RSpec.describe PlacesController, type: :controller do
  describe "GET new" do
  	login_user
  	it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET index" do
  	login_user
    it "assigns @places and @place_coordinates" do
      user_id = User.find_by(email: subject.current_user.email).id
      place = FactoryBot.create(:place, public: true, user_id: user_id)
      get :index
      expect(assigns(:places)).to eq([place])
      expect(assigns(:place_coordinates)).to eq([[place.longitude, place.latitude]])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "POST create" do
  	login_user
  	it "creates a new place if params are valid and redirect to places index page" do
      user_id = User.find_by(email: subject.current_user.email).id
      post :create, {
      	place: {
      		title: "First Share",
      		address: "MG Road, Chennai, Tamilnadu, India",
      		public: true,
      		user_id: user_id
      	}
      }
      expect(subject).to redirect_to(places_path)
    end

    it "should not create a new place if params are invalid and redirect to places new page" do
      user_id = User.find_by(email: subject.current_user.email).id
      post :create, {
      	place: {
      		title: "First Share",
      		address: '',
      		public: true,
      		user_id: user_id
      	}
      }
      expect(response).to render_template("new")
    end
  end

  describe "GET show" do
  	login_user
  	it "renders the new template" do
  	  user_id = User.find_by(email: subject.current_user.email).id
      place = FactoryBot.create(:place, public: true, user_id: user_id)
      get :show, id: place.id
      expect(assigns(:place)).to eq(place)
    end
  end

  describe "GET public share places" do
  	it "lists public shared places if username(email) exists" do
  	  user = FactoryBot.create(:user)
      place = user.places.create(title: 'Second Share', address: 'Juhu, Mumbai', public: true)
  	  get(:public_share, params: { username: user.email })
      expect(assigns(:places).first.id).to eq(place.id)
      expect(assigns(:place_coordinates)).to eq([[place.longitude, place.latitude]])
    end

    it "lists public shared places if username(email) exists" do
  	  get(:public_share, params: { username: 'abc@example.com' })
      expect(subject).to redirect_to(root_path)
    end
  end
end
