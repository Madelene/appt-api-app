class UpdatingApptsTest < ActionDispatch::IntegrationTest
  setup { @appointment = Appointment.create!(first_name: 'Update', last_name: 'Test', start_time: '12-9-2015T11:00:00.000Z', end_time: '12-9-2015T11:00:00.000Z') }
  test 'successful update' do
    patch  "/appointments/#{@appointment.id}",
    { appointment: { first_name: 'Update Changes'} }.to_json,
    { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

  assert_equal 200, response.status
  assert_equal 'Update Changes', @appointment.reload.first_name #reloaded from database and populated with latest data
  end
end