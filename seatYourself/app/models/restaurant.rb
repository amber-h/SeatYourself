class Restaurant < ActiveRecord::Base
  attr_accessible :addr, :close_hour, :name, :open_hour, :phone, :picture, :seats, :user_id, :website, :category_ids

  has_many :reservations
  belongs_to :user

  has_and_belongs_to_many :categories, :join_table => 'categories_restaurants'

	def self.search(search)
	  if search
	    #find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	    where('name LIKE ?', "%#{search}%")
	  else
	    find(:all)
	  end
	end

	def seats_available
		 return self.reservations.partySize
	end

	def self.display_by_categories(category_ids)
			if category_ids
				self.includes(:categories).where('categories.id in (?)', category_ids)
			else
				 find(:all)
			end
	end
end
