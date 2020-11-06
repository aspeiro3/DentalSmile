class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:edit, :update, :destroy]

  def new
    @appointment = Appointment.new
  end

  def edit
  end

  def create
    @new_appointment = Appointment.new(appointment_params)
    @new_appointment.user = current_user
    @new_appointment.doctor_id = params[:doctor_id] || params[:appointment]['doctor_id'].to_i

    if @new_appointment.save
      redirect_to user_path(current_user), notice: I18n.t('controllers.appointments.create.created')
    else
      redirect_to user_path(current_user), alert: I18n.t('controllers.appointments.create.error')
    end
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to doctor_path(current_doctor), notice: I18n.t('controllers.appointments.update.updated')
    else
      redirect_to doctor_path(current_doctor), notice: I18n.t('controllers.appointments.update.error')
    end
  end

  def destroy
    @appointment.destroy
    redirect_to user_path, notice: I18n.t('controllers.appointments.destroyed')
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.fetch(:appointment, {}).permit(:comment, :doctor_id)
  end
end
