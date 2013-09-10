class Venue < ActiveRecord::Base
  attr_accessible :address_1, :address_2, :description, :name, :post_code, :user_id
  has_many :events
  belongs_to :user
end
