class DoctorsController < ApplicationController
  before_action :authenticate_doctor!, except: [:show, :index]
  before_action :set_current_doctor, except: [:show]

  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = current_doctor || Doctor.find(params[:id])
    @doctors = Doctor.all
    @doctor_id = @doctor.id
  end

  def edit
  end

  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to @doctor, notice: I18n.t('controllers.doctors.updated') }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def set_current_doctor
    @doctor = current_doctor
  end

  def doctor_params
    params.require(:doctor).permit(:name, :email, :avatar)
  end
end
