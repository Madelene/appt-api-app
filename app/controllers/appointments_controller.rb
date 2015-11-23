class AppointmentsController < ApplicationController
  before_action :set_appt, only: [:update, :destroy]

  def index
    appointments = Appointment.all #issues query to database

    respond_to do |format| # allows us to control different types of formats app will respond to
      format.json { render json: zombies, status: 200 }
    end

    if start_time = params[:start_time]
      appointments = appointments.where(start_time: start_time) #adding filters, dynamically, with "where" method
    end

    if end_time = params[:end_time]
      appointments = appointments.where(end_time: end_time)
    end

    render json: appointments, status: 200 #fetching all of the appointments and returning them as json
  end

  private
  def appointment_params
    params.require(:appointment).permit(:first_name, :last_name, :start_time, :end_time, :comments,)
  end

  def set_appt
    @appointment = Appointment.find(params[:id])
  end
end
