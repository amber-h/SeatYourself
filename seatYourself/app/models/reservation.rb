class Reservation < ActiveRecord::Base
	attr_accessible :date, :partySize, :time, :user_id, :restaurant_id, :reservation_date

	belongs_to :restaurant
  	belongs_to :user

  	validates :partySize,
		:numericality => { :only_integer => true, :greater_than => 0 }

	validate :partySize_is_valid
	validate :date_is_valid

	def partySize_is_valid
    	errors.add(:partySize,"Not enough palces for that party size on this day and time") if 
      !partySize_check
  end

  	def date_is_valid
    	errors.add(:reservation_date,"The restaurant is not open at this time") if
    	reservation_date.hour < self.restaurant.open_hour.to_i || reservation_date.hour > self.restaurant.close_hour.to_i
  	end

  	private 
  	def partySize_check
		i = 0
      	taken_seats=0
     	while (i < self.restaurant.reservations.size)
     		if (reservation_date == self.restaurant.reservations[i].reservation_date)
     			taken_seats += self.restaurant.reservations[i].partySize
     		end
     		i+=1
     	end
     	if (taken_seats + partySize < self.restaurant.seats)
     		return true
     	else
     		return false
     	end
  	end
end

