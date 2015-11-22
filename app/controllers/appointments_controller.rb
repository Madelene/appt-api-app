class AppointmentsController < ApplicationController
  def index
    appointments = Appointment.all
    render json: appointments, status: 200 #fetching all of the appointments and returning them as json
  end
end
