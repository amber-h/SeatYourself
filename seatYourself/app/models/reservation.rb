class Reservation < ActiveRecord::Base
  attr_accessible :date, :partySize, :time, :user_id, :restaurant_id, :reservation_date

  belongs_to :restaurant
  belongs_to :user

  validates :partySize,
		:numericality => { :only_integer => true, :greater_than => 0 }


	before_save(:on => :create) do
		self.restaurant.seats -= self.partySize
		self.restaurant.save!
	end

end
