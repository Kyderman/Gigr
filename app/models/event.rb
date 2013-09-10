class Event < ActiveRecord::Base
  attr_accessible :date, :description, :name, :user_id
  has_many :bands_event
  belongs_to :user
  has_many :bands, through: :bands_event
end
