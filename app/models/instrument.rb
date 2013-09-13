class Instrument < ActiveRecord::Base
  attr_accessible :name, :musician_id
  has_many :musicians_instrument
  has_many :musicians, through: :musicians_instrument
end
