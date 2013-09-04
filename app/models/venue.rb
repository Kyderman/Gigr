class Venue < ActiveRecord::Base
  attr_accessible :address_1, :address_2, :description, :name, :post_code, :user_id
  
  belongs_to :user
end
