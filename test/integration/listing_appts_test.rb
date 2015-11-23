require 'test_helper'

class ListingApptsTest < ActionDispatch::IntegrationTest

  test 'returns list of all appointments' do
    get '/appointments'
    assert_equal 200, response.status #this means the request has succeeded
  end
end