require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    subject { get :index }

    # This may work...
    it { should have_http_status(:success) }
  end
end
