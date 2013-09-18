class Band < ActiveRecord::Base
  attr_accessible :description, :name, :user_id, :musician_ids
  has_many :bands_musician
  has_many :bands_event
  belongs_to :user
  has_many :musicians, through: :bands_musician
  has_many :events, through: :bands_event
  accepts_nested_attributes_for :events, :bands_event
  
  def is_member(m)
    @cur = BandsMusician.where(band_id: self.id, musician_id: m.id).first
    if @cur.accepted == true
      return true
    end
    return false
  end
  
  def make_member(m)
    @cur = BandsMusician.where(band_id: self.id, musician_id: m.id).first
    @cur.accepted = true
    @cur.save
  end
  
  def get_invited
    @invited =[]
  
    self.musicians.each do |m|    
      if !self.is_member(m)
        @invited << m  
      end          
    end
    return @invited
  end
  
  def get_members
    @members =[]
  
    self.musicians.each do |m|    
      if self.is_member(m)
        @members << m  
      end          
    end
    return @members
  end
end
