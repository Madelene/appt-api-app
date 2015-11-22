require 'test_helper'

class ListingApptsTest < ActionDispatch::IntegrationTest
  setup { host! 'example.com'}

  test 'returns list of all appointments' do
    get '/appointments'
    assert_equal 200, response.status #this means the request has succeeded
    refute_empty response.body #200 responses should include the resources
  end
end