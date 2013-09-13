class MusiciansInstrument < ActiveRecord::Base
  attr_accessible :instrument_id, :musician_id
   
  belongs_to :instrument
  belongs_to :musician
end
