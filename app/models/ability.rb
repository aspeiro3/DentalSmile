class Ability
  include CanCan::Ability

  def initialize(user, doctor, admin)
    if admin
      can :read, User
      can :manage, Doctor
      can :manage, Appointment
      can :manage, DoctorSpecialization
    end

    if user
      can :read, :all
      can [:update, :destroy],  User, id: user.id
      can [:create, :destroy], Appointment
    end

    if doctor
      can :read, :all
      can :create, Appointment 
    end
  end
end
