class Restaurant < ActiveRecord::Base
  attr_accessible :addr, :close_hour, :name, :open_hour, :phone, :picture, :seats, :user_id, :website

  acts_as_gmappable

  has_many :reservations
  belongs_to :user

	def self.search(search)
	  if search
	    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	  else
	    find(:all)
	  end
	end

	def seats_available
		 taken = 0
		 self.reservations.each do |r|
		 	taken += r.partySize
		 end
		 available = self.seats-taken
		 return available
	end

	def gmaps4rails_address
		#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  		"#{self.street}, #{self.city}, #{self.country}" 
	end
	
end
