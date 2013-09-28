class Restaurant < ActiveRecord::Base
  attr_accessible :addr, :close_hour, :name, :open_hour, :phone, :picture, :seats, :user_id, :website, :category_ids

  acts_as_gmappable

  has_many :reservations
  belongs_to :user

  has_and_belongs_to_many :categories, :join_table => 'categories_restaurants'

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

	def self.search(search)
	  if search
	    #find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	    where('name LIKE ?', "%#{search}%")
	  else
	    find(:all)
	  end
	end
	
	# To search for name as well as display for the category chosen at the same time
	def self.search_and_category(category_ids,search)
		if category_ids 
			self.includes(:categories).where('categories.id in (?)', category_ids)
		elsif search
			where('name LIKE ?', "%#{search}%")
		elsif category_ids && search
			where('categories.id in (?)', category_ids).where('name LIKE ?', "%#{search}%")
		else
			find(:all)
		end
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
