class CreateCategoriesRestaurantsJoinTable < ActiveRecord::Migration
	def change
	 	create_table :categories_restaurants do |t|
	 	t.integer "category_id"
	 	t.integer "restaurant_id"
	 end
	end
end
