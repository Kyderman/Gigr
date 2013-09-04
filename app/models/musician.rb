class Musician < ActiveRecord::Base
  attr_accessible :instrument, :name, :user_id
end
