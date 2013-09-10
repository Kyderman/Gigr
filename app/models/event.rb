class Event < ActiveRecord::Base
  attr_accessible :date, :description, :name, :venue_id, :band_ids
  has_many :bands_event
  belongs_to :venue
  has_many :bands, through: :bands_event
  accepts_nested_attributes_for :bands, :bands_event
  
  def start_time
    date
  end
end
