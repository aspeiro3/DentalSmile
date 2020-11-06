class Doctor < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments

  has_many :doctor_specializations, dependent: :destroy
  has_many :specializations, through: :doctor_specializations

  validates :name, presence: true, length: { maximum: 35 }
  before_validation :set_name, on: :create

  private

  def set_name
    self.name = "Доктор №#{rand(999)}" if self.name.blank?
  end
end
