class RestaurantsController < ApplicationController
	before_filter :ensure_logged_in, :except => [:show, :index]
	before_filter :load_user, :only => [:new, :create]
	before_filter :get_restaurant, :only => [:show, :edit, :destroy, :update]

	

	def index
		#@restaurants = Restaurant.all
		#@restaurants = Restaurant.search(params[:search])
		#@restaurants = Restaurant.includes(:categories).where('categories.id in (?)',params[:category])
		
		@restaurants = Restaurant.display_by_categories(params[:category])

		respond_to do |format|
			format.html
			format.json { render json: @restaurants}
		end
	end

	def show

		respond_to do |format|
			format.html
			format.json { render json: @restaurants}
		end
	end

	def edit

	end


	def update 
		respond_to do |format|
		  	if @restaurant.update_attributes(params[:restaurant])
		  		format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully updated.' }
		        format.json { head :no_content }
		  	else 
		  		format.html { render action: "edit" }
		        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
		  	end
	  	end
	end

	def new
		@category = Category.new
		@restaurant = Restaurant.new

		respond_to do |format|
			format.html
			format.json { render json: @restaurants}
		ensure_logged_in
		end
	end

	def create
		# @restaurant = Restaurant.new(params[:restaurant])
		# @restaurant = Restaurant.new(:user_id => @user.id)
		@restaurant = @user.restaurants.build(params[:restaurant])
		#@restaurant.categories = @category.cuisine
		#@restaurant.user_id = current_user.id 

	    respond_to do |format|
	      if @restaurant.save
	        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
	        format.json { render json: @restaurant, status: :created, location: @restaurant }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def destroy
  		@restaurant.destroy

	  	respond_to do |format|
	      format.html { redirect_to restaurants_url }
	      format.json { head :no_content }
	    end
  	end

	def manage_restaurant
		@users_restaurants = current_user.restaurants 
		#shows the current users restaurants only
	end

  	private
	  def get_restaurant
	    @restaurant = Restaurant.find(params[:id])
	  end
	private
	  def load_user
  		@user= User.find(current_user.id)
  	  end
end
