class RestaurantsController < ApplicationController
	before_filter :ensure_logged_in, :only => [:show]
	before_filter :get_restaurant, :only => [:show, :edit, :destroy, :update]

	def index
		@restaurants = Restaurant.all

		@restaurants = Restaurant.search(params[:search])

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

	def new
		@restaurant = Restaurant.new

		respond_to do |format|
			format.html
			format.json { render json: @restaurants}
		end
	end

	def create
		@restaurant = Restaurant.new(params[:restaurant])

	    respond_to do |format|
	      if @restaurant.save
	        format.html { redirect_to @restaurant, notice: 'Product was successfully created.' }
	        format.json { render json: @restaurant, status: :created, location: @restaurant }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def update 

	  	if @restaurant.update_attributes(params[:restaurant])
	  		format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
	        format.json { head :no_content }
	  	else 
	  		format.html { render action: "edit" }
	        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
	  	end
	end

	def destroy
  		@restaurant.destroy

	  	respond_to do |format|
	      format.html { redirect_to restaurants_url }
	      format.json { head :no_content }
	    end
  	end

  	def search
  		@restaurant = Restaurant.search(params[:search])
	end

	def manage_restaurant

	end

  	private
	  def get_restaurant
	    @restaurant = Restaurant.find(params[:id])
	  end

end
