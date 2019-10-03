require 'rails_helper'

RSpec.describe 'Users Controller', type: :request do
  let!(:users) { create_list(:user, 10) }
  let(:user_id) { users.first.id }
  describe 'GET /users' do
    before { get '/users' }

    it 'returns users' do
      expect(users.size).to eq(10)
    end
  end
end
