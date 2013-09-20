class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
      can :read, :all
      cannot :index, :all
      if user.has_role? :musician
        can :view, :musician
        can :update, Musician do |m|
          m.try(:user) == user
        end
        can :reject, BandsMusician do |b|
          b.try(:musician_id) == musician_id
        end
        can :accept, BandsMusician do |b|
          b.try(:musician_id) == musician_id
        end
      elsif user.has_role? :band
        can :req, BandsMusician
        
        can :reject, BandsMusician do |b|
          b.try(:band_id) == band_id
        end
        can :view, :band
        can :update, Band do |b|
          b.try(:user) == user
        end
        can :destroy, Band do |b|
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
        can :create, Event
        can :update, Event do |e|
          e.try(:venue) == Venue.where(user_id: user.id).first
        end
      end
    end
     
      
     
      
      
      
      
      
    
  end
end