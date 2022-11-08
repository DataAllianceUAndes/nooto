# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :create, User
    return unless user.present?
      can :read, Classnote
      can [:create, :update, :destroy], Classnote, user: user
      can :read, Course
      can [:create, :update], Course, user: user
      can :read, Enrollment
      can [:create, :update], Enrollment, user: user
      can :read, User
      can [:create, :update], User, user: user
    # return unless user.admin?
    #   can :manage, :all
  end
end
