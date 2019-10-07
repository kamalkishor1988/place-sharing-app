require 'rails_helper'
require_relative '../support/devise'

RSpec.describe UsersController, type: :controller do
  let!(:users) { create_list(:user, 10) }

  describe "GET index" do
  	login_user
    it "assigns @users" do
      get :index
      expect(assigns(:users).count).to eq(users.count + 1)
    end
  end
end
