require 'test_helper'

class CreatingApptsTest < ActionDispatch::IntegrationTest
  test 'creates appointment' do
    post '/appointments',
      { appointment:
          { first_name: 'Maddie', last_name: 'Campos', start_time: '12-09-2015T10:00:00.000Z', end_time: '12-9-2015T11:00:00.000Z' }
          }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s } #parse content in JSON
      assert_equal 201, response.status #created
      assert_equal Mime::JSON, response.content_type #content type of response is JSON
    end

  test 'does not create appointment with first name nil' do
    post '/appointments',
    { appointment:
      { first_name: nil, last_name: 'Campos', start_time: '12-09-2015T10:00:00.000Z', end_time: '12-09-2015T11:00:00.000Z' }
    }.to_json,
    { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    assert_equal 422, response.status # 422 == error occurred and client is to blame
  end

  test 'does not create appointment with last name nil' do
    post '/appointments',
    { appointment:
      { first_name: 'Maddie', last_name: nil, start_time: '12-09-2015T10:00:00.000Z', end_time: '12-09-2015T11:00:00.000Z' }
    }.to_json,
    { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    assert_equal 422, response.status
  end


# When creating an appt, it is only valid if the start and end times are in the future
  # test 'no start dates in the past' do
  #   post '/appointments',
  #   { appointment:
  #     { first_name: 'Maddie', last_name: 'Campos', start_time: '11-23-2015T18:00:00.000Z', end_time: '11-23-2015T19:00:00.000Z' }
  #   }.to_json,
  #   { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
  #   assert_equal 422, response.status #Unprocessable entity (well-formed request from client, but semantically invalid)
  #   end

  # test 'no end dates in the past' do
  #   post '/appointments',
  #   { appointment:
  #     { first_name: 'Maddie', last_name: 'Campos', start_time: '11-23-2015T18:00:00.000Z', end_time: '11-23-2015T19:00:00.000Z' }
  #   }.to_json,
  #   { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
  #   assert_equal 422, response.status
end

