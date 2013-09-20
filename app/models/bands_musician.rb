class BandsMusician < ActiveRecord::Base
  attr_accessible :band_id, :musician_id, :accepted
  belongs_to :band
  belongs_to :musician
  
  def self.are_friends(band, musician)
    return false if band == musician
    return true unless find_by_band_id_and_musician_id(band, musician).nil?
    false
  end
  
  def self.request(band, musician)
    return false if are_friends(band, musician)
    f1 = new(:band => band, :musician => musician)
    transaction do
      f1.save
    end
  end
  
  def self.accept(musician, band)
    f1 = find_by_band_id_and_musician_id(band, musician)
   
    if f1.nil?
      return false
    else
      transaction do
        f1.update_attributes(:accepted => true)
        f1.save
      end
    end
    return true
  end
  
  def self.reject(musician, band)
    f1 = find_by_band_id_and_musician_id(band, musician)
    
    if f1.nil?
      return false
    else
      transaction do
        f1.destroy
        return true
      end
    end
  end
  
end
