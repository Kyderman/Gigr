class Musician < ActiveRecord::Base
  attr_accessible :name, :user_id
  has_many :bands_musician
  has_many :musicians_instrument
  has_many :instruments, through: :musicians_instrument
  belongs_to :user
  has_many :bands, through: :bands_musician
  
end
