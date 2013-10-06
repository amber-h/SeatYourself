class Review < ActiveRecord::Base
  attr_accessible :comment, :restaurant_id, :user_id

  belongs_to :user
  belongs_to :restaurant

  validates :comment, :presence => true
end
