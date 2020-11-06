class Specialization < ApplicationRecord
  has_many :doctor_specializations, dependent: :destroy
  has_many :doctors, through: :doctor_specializations

  validates :title,
            presence: true,
            uniqueness: true,
            length: { maximum: 35 }

  before_save :title_downcase

  private

  def title_downcase
    self.title = title.downcase
  end
end
