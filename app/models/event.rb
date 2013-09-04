class Event < ActiveRecord::Base
  attr_accessible :date, :description, :name, :user_id
  
  belongs_to :user
  has_many :bands, through: :bands_events
end
