class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments

  validates :name, presence: true, length: { maximum: 35 }
  before_validation :set_name, on: :create

  private

  def set_name
    self.name = "Пользователь №#{rand(999)}" if self.name.blank?
  end
end
