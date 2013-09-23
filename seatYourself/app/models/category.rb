class Category < ActiveRecord::Base
  attr_accessible :cuisine, :restaurant_id

  has_and_belongs_to_many :restaurants, :join_table => 'categories_restaurants'
end
