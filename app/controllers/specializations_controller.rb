class SpecializationsController < ApplicationController
  before_action :set_specialization, only: [:show, :edit, :update, :destroy]

  def index
    @specializations = Specialization.all
  end

  def show
    @specialization = Specialization.find(params[:id])
  end

  def new
    @specialization = Specialization.new
  end

  def edit
  end

  def create
    @new_specialization = Specialization.new(appointment_params)
    @new_specialization.doctor_id = params[:doctor_id]
    
    if @new_specialization.save
      redirect_to doctor_specializations_path, notice: I18n.t('controllers.specializations.create.created')
    else
      redirect_to doctor_specializations_path, alert: I18n.t('controllers.specializations.create.error')
    end
  end

  def update
    if @specialization.update(specialization_params)
      redirect_to doctor_specializations_path, notice: I18n.t('controllers.specializations.update.updated')
    else
      redirect_to doctor_specializations_path, notice: I18n.t('controllers.specializations.update.error')
    end
  end

  def destroy
    @specialization.destroy
    redirect_to doctor_specializations_path, notice: I18n.t('controllers.specializations.destroyed')
  end

  private

  def set_specialization
    @specialization = Specialization.find(params[:id])
  end

  def specialization_params
    params.fetch(:specialization, {}).permit(:title, :doctor_id)
  end
end
