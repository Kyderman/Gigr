class Band < ActiveRecord::Base
  attr_accessible :description, :name, :user_id, :musician_ids
  has_many :bands_musician
  has_many :musicians, through: :bands_musician
  has_many :bands_event
  belongs_to :user
  
  has_many :events, through: :bands_event
  accepts_nested_attributes_for :events, :bands_event
  
  
  def invited_members
    @inv = []
    
    self.musicians.each do |r|
      
      if BandsMusician.where(band_id: self.id, musician_id: r.id).first.accepted == false
        @inv << r
      end
      
    end
    
    return @inv
  end
  
  def members
    @inv = []
    
    self.musicians.each do |r|
      
      if BandsMusician.where(band_id: self.id, musician_id: r.id).first.accepted == true
        @inv << r
      end
      
    end
    
    return @inv
  end
  

  
end
