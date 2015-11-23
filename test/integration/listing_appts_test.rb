require 'test_helper'

class ListingApptsTest < ActionDispatch::IntegrationTest

  test 'returns list of all appointments' do
    get '/appointments'
    assert_equal 200, response.status #this means the request has succeeded
  end

  test 'returns appointments in JSON' do
    get '/appointments', { }, { 'Accept' => Mime::JSON } #Tells server we want the JSON format
    assert_equal 200, response.status
    assert_equal Mime::JSON , response.content_type #checks that server responds with proper format by looking at content header
  end

end