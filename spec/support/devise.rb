require_relative './spec_test_helper'
RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.extend SpecTestHelper, type: :controller
end
