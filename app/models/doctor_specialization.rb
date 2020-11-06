class DoctorSpecialization < ApplicationRecord
  belongs_to :doctor
  belongs_to :specialization

  validate :validates_only_one_specialization, on: :create

  private

  def validates_only_one_specialization
    errors.add(:doctor_id) if
        DoctorSpecialization.
        where(specialization_id: specialization_id).
        where(doctor_id: doctor_id).
        present?
  end
end
