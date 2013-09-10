class Musician < ActiveRecord::Base
  attr_accessible :instrument, :name, :user_id
  has_many :bands_musician
  belongs_to :user
  has_many :bands, through: :bands_musician
  
end
