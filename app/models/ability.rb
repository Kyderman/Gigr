class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
      can :view, :musician if user.has_role? :musician
      can :view, :band if user.has_role? :band
      
    end
  end
end