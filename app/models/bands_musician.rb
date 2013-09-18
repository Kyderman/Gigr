class BandsMusician < ActiveRecord::Base
  attr_accessible :band_id, :musician_id, :accepted
  belongs_to :band
  belongs_to :musician
  
  
  
  
end
