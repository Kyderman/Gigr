class Band < ActiveRecord::Base
  attr_accessible :description, :name, :user_id
  
  belongs_to :user
  has_many :musicians, through: :bands_musicians
  has_many :events, through: :bands_events
end
