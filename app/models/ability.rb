class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
      can :read, :all
      if user.has_role? :musician
        can :view, :musician
        can :update, Musician do |m|
          m.try(:user) == user
        end
      elsif user.has_role? :band
        can :view, :band
        can :update, Band do |b|
          b.try(:user) == user
        end
        can :update, Musician do |m|
          m.try(:user) == user
        end
      elsif user.has_role? :venue
        can :view, :venue
        can :update, Venue do |v|
          v.try(:user) == user
        end
        can :manage, Event do |e|
          e.try(:user) == user
        end
      end
    end
     
      
     
      
      
      
      
      
    
  end
end