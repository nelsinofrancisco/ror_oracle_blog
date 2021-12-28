class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    return unless user.present? # additional permissions for logged in users

    can :create, Comment
    can :create, Like
    can :create, Post
    can %i[update destroy], Post, author_id: user.id
    can %i[update destroy], Comment, author_id: user.id

    return unless user.is? :admin # additional permissions for administrators

    can :manage, :all
  end
end
