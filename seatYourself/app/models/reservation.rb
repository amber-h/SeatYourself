class Reservation < ActiveRecord::Base
  attr_accessible :date, :partySize, :time
end
