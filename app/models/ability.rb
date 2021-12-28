# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, User, user: user
    can :read, Post, user: user
    can :read, Comment, user: user
    can :read, Like, user: user

    return unless user.present? # additional permissions for logged in users

    can %i[update destroy], Post, author_id: user.id
    can %i[update destroy], Comment, author_id: user.id

    return unless user.is? :admin # additional permissions for administrators

    can :manage, :all
  end
end
