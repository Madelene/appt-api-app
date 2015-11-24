class AppointmentsController < ApplicationController
  before_action :set_appt, only: [:update, :destroy]

  def index
      appointments = Appointment.all #issues query to database

      if start_time = params[:start_time]
      appointments = appointments.where(start_time: start_time) #adding filters, dynamically, with "where" method
      end

      if end_time = params[:end_time]
      appointments = appointments.where(end_time: end_time)
      end
      render json: appointments, status: 200 #fetching all of the appointments and returning them as json
  end

    def create
      appointment = Appointment.new(appointment_params)

      if appointment.save
        render json: appointment, status: :created, location: appointment #used created symbol instead of 201, just for fun.
      else
        render json: appointment.errors, status: :unprocessable_entity #same as 422
      end
    end

    def update
      if @appointment.update(appointment_params)
        render json: @appointment, status: 200
      else
        render json: @appointment.errors, status: 422
      end
    end

    def destroy
      @appointment.destroy #removes the record from the database
       head 204
    end

    private
    def appointment_params
      params.require(:appointment).permit(:first_name, :last_name, :start_time, :end_time, :comments,)
    end

    def set_appt
      @appointment = Appointment.find(params[:id])
    end
end
