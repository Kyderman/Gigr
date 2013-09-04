class Event < ActiveRecord::Base
  attr_accessible :date, :description, :name, :user_id
end
