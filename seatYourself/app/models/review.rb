class Review < ActiveRecord::Base
  attr_accessible :comment, :restaurant_id, :user_id

  belongs_to :user_id
  belongs_to :restaurant
end
