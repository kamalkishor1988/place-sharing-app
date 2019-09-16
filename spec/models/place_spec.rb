require 'rails_helper'

RSpec.describe Place, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:user) }
    it { should validate_inclusion_of(:public).in_array([true, false]) }
  end
end
