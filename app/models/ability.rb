# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :manage, :all
    else
      can :create, Booking
      can :read, Show
      can :read, Movie
      cannot :manage, ActiveAdmin::Page
    end
  end
end
