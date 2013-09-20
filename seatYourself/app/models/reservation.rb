class Reservation < ActiveRecord::Base
  attr_accessible :date, :partySize, :time, :user_id, :rest_id

  belongs_to :restaurant
  belongs_to :user

end
