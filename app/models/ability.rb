class Ability
  include CanCan::Ability

  def initialize(user, doctor, admin)
    if admin
      can :read, User
      can :manage, AdminUser
      can :manage, Doctor
      can :manage, Appointment
      can :manage, DoctorSpecialization
    end

    if user
      can :read, [User, Doctor, Appointment]
      can [:create, :update, :destroy],  User, id: user.id
      can [:create, :destroy], Appointment
    end

    if doctor
      can :read, [User, Doctor, Appointment]
      can [:create, :update, :destroy],  Doctor, id: doctor.id
      can :create, Appointment
    end
  end
end
