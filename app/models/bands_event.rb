class BandsEvent < ActiveRecord::Base
  attr_accessible :band_id, :event_id, :accepted
  belongs_to :band
  belongs_to :event
end
