require 'rails_helper'

RSpec.describe 'Places Controller' do
  let!(:user) { create(:user) }
  let!(:places) { create_list(:place, 20, user_id: user.id, public: true) }
  let(:user_id) { user.id }
  let(:id) { places.first.id }

  describe 'GET /places' do
    before { get "/places" }

    context 'when user exists' do
      it 'returns all user places' do
        p places.first
        expect(places.size).to eq(20)
      end
    end
  end

  describe 'POST /places' do
    let(:valid_attributes) { { title: 'First Place', address: "East Nichelle", public: true, user_id: user_id } }

    context 'when request attributes are valid' do
      before { post "/places", params: valid_attributes }

      it 'returns places count' do
        expect(assigns(:places)).not_to be_nil
        expect(assigns(:places)).to eq(1)
      end
    end
  end
end
