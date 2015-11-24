class DeletingApptsTest < ActionDispatch::IntegrationTest
  setup { @appointment = Appointment.create(first_name: 'Delete', last_name: 'Test', start_time: '12-10-2015T11:00:00.000Z', end_time: '12-9-2015T11:00:00.000Z') } #we create a new appointment

  test 'deletes appointment' do #tests that we're able to delete that existing appointment
    delete "/appointments/#{@appointment.id}"
    assert_equal 204, response.status #expecting a successful response, but not expecting a response body back
  end
end