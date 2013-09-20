class Musician < ActiveRecord::Base
  attr_accessible :name, :user_id, :instrument_ids, :band_id
  has_many :bands, through: :bands_musician
  has_many :bands_musician
  has_many :musicians_instrument
  has_many :instruments, through: :musicians_instrument
  belongs_to :user
  
  def invited_bands
    @inv = []
    
    self.bands.each do |r|
      
      if BandsMusician.where(band_id: r.id, musician_id: self.id).first.accepted == false
        @inv << r
      end
      
    end
    
    return @inv
  end
  
  def member_bands
    @inv = []
    
    self.bands.each do |r|
      
      if BandsMusician.where(band_id: r.id, musician_id: self.id).first.accepted == true
        @inv << r
      end
      
    end
    
    return @inv
  end
  
  
  
end
