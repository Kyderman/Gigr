class Musician < ActiveRecord::Base
  attr_accessible :instrument, :name, :user_id
  
  belongs_to :user
  has_many :bands, through: :bands_musicians
end
