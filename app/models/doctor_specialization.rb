class DoctorSpecialization < ApplicationRecord
  belongs_to :doctor
  belongs_to :specialization

  validate :doctor_cannot_have_the_same_specialization_several_times, on: :create

  private

  def doctor_cannot_have_the_same_specialization_several_times
    errors.add(:doctor_id) if
        DoctorSpecialization.
        where(specialization_id: specialization_id).
        where(doctor_id: doctor_id).
        present?
  end
end
