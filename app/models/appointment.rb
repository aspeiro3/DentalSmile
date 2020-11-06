class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates :comment, length: { maximum: 255 }

  validate :user_cannot_be_assigned_twice_while_there_is_no_comment, on: :create

  private

  def user_cannot_be_assigned_twice_while_there_is_no_comment
    errors.add(:comment) if
      Appointment.where(user_id: user_id).
        where(doctor_id: doctor_id).
        where(comment: nil).
        present?
  end
end
