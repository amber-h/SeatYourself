class RestaurantsController < ApplicationController
	before_filter :ensure_logged_in, :only => [:show]
	before_filter :load_user, :only => [:new, :create]
	before_filter :get_restaurant, :only => [:show, :edit, :destroy, :update]

	ActionController::Base.helpers.asset_path('fastfood.png')

	def index
		@restaurants = Restaurant.all

		@restaurants = Restaurant.search(params[:search])

		respond_to do |format|
			format.html
			format.json { render json: @restaurants}
		end
	end

	def show
		@json = Restaurant.find(params[:id]).to_gmaps4rails do |restaurant, marker|
		  	marker.infowindow render_to_string(:partial => "/restaurants/infowindow", :locals => { :restaurant => restaurant })
		    marker.title "#{restaurant.name}"
		    # marker.json({ :population => city.population})
		    marker.picture({:picture => 'fastfood.png',
		                    :width => 32,
		                    :height => 32})
		end

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
		# @restaurant = Restaurant.new(params[:restaurant])
		# @restaurant = Restaurant.new(:user_id => @user.id)
		@restaurant = @user.restaurants.build(params[:restaurant])
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

	def update 
		
	  	if @restaurant.update_attributes(params[:restaurant])
	  		format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully updated.' }
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
