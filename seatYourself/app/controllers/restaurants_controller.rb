class RestaurantsController < ApplicationController

	before_filter :get_restaurant, :only => [:show, :edit, :destroy, :update]

	def index
		# @restaurants = Restaurant.all

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
		@restaurant = Restaurant.create(params[:restaurant])
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

  	private
	  def get_restaurant
	    @restaurant = Restaurant.find(params[:id])
	  end

end
