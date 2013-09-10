class Band < ActiveRecord::Base
  attr_accessible :description, :name, :user_id
  has_many :bands_musician
  has_many :bands_event
  belongs_to :user
  has_many :musicians, through: :bands_musician
  has_many :events, through: :bands_event
end
