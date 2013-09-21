class Reservation < ActiveRecord::Base
  attr_accessible :date, :partySize, :time, :user_id, :restaurant_id, :reservation_date

  belongs_to :restaurant
  belongs_to :user
end
