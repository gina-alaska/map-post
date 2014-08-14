class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    
    can :read, Event
    can :read, Group
    
    return if user.new_record?
    
    can [:new, :create], Event
    can [:edit, :update, :destroy], Event do |event|
      event.user == user
    end
    
    can [:new, :create], Report
    can [:read, :edit, :update, :destroy], Report do |report|
      report.user == user
    end
    
    can [:new, :create], Group
    can [:edit, :update, :destroy], Group do |group|
      group.user == user
    end
    
    if user.member?
      can :read, Report
      can :manage, Event
      can :manage, Group
      can :manage, Membership
      can :manage, User
    end
    
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
