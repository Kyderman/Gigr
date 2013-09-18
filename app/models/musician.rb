class Musician < ActiveRecord::Base
  attr_accessible :name, :user_id, :instrument_ids, :band_id
  has_many :bands_musician
  has_many :musicians_instrument
  has_many :instruments, through: :musicians_instrument
  belongs_to :user
  has_many :bands, through: :bands_musician
  
  
  def get_band_invites
    @invites =[]
  
    self.bands.each do |b|    
      if !b.is_member(self)
        @invites << b  
      end          
    end
    return @invites
  end
  
  def accept_band_invite(b)
    @cur = BandsMusician.where(band_id: b.id, musician_id: self.id).first
    @cur.accepted = true
    @cur.save
  end
end
