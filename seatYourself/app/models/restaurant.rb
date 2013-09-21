class Restaurant < ActiveRecord::Base
  attr_accessible :addr, :close_hour, :name, :open_hour, :phone, :picture, :seats, :user_id, :website

  has_many :reservations
  belongs_to :user

	def self.search(search)
	  if search
	    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	  else
	    find(:all)
	  end
	end
	
end
