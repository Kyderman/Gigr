class BandsEvents < ActiveRecord::Base
  attr_accessible :band_id, :event_id
  belongs_to :band
  belongs_to :event
end
