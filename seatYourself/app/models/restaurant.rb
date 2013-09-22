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
  		self.addr
  		# "#{self.street}, #{self.city}, #{self.country}" 
	end

	def gmaps4rails_marker_picture
    {
	    "picture" => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=A|FF0000|000000", # image_path column has to contain something like '/assets/my_pic.jpg'.
	    "width" => 32, #beware to resize your pictures properly
	    "height" => 32 #beware to resize your pictures properly
	}
	end

end
