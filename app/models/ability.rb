# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :delete, [Post, Comment], user

    return unless user.is? :admin

    can :delete, [Post, Comment]
  end
end
