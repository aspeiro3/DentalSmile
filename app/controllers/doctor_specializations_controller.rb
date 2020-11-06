class DoctorSpecializationsController < ApplicationController
  before_action :set_doctor_specialization, only: [:show, :edit, :update, :destroy]

  def index
    @doctor_specializations = DoctorSpecialization.all
  end

  def show
    @doctor_specialization = DoctorSpecialization.find(params[:id])
  end

  def new
    @doctor_specialization = DoctorSpecialization.new
  end

  def edit
  end

  def create
    @doctor_specialization = DoctorSpecialization.new(doctor_specialization_params)
    @doctor_specialization = params[:specialization_id]
    @doctor_specialization = params[:doctor_id]

    if @doctor_specialization.save
      redirect_to doctor_specializations_path, notice: I18n.t('controllers.doctor_specializations.create.created')
    else
      redirect_to doctor_specializations_path, alert: I18n.t('controllers.doctor_specializations.create.error')
    end
  end

  def update
    if @doctor_specialization.update(doctor_specialization_params)
      redirect_to doctor_specializations_path, notice: I18n.t('controllers.doctor_specializations.update.updated')
    else
      redirect_to doctor_specializations_path, notice: I18n.t('controllers.doctor_specializations.update.error')
    end
  end

  def destroy
    @doctor_specialization.destroy
    redirect_to doctor_specializations_path, notice: I18n.t('controllers.doctor_specializations.destroyed')
  end

  private

  def set_doctor_specialization
    @doctor_specialization = DoctorSpecialization.find(params[:id])
  end

  def doctor_specialization_params
    params.fetch(:doctor_specialization, {}).permit(:specialization_id, :doctor_id)
  end
end
