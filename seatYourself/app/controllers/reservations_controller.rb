class ReservationsController < ApplicationController

	before_filter :get_reservation, :only => [:show, :edit, :destroy, :update]
	before_filter :get_restaurant, :except => [:manage_reservation, :show, :edit]

	def index
		@reservations = Reservation.all

		respond_to do |format|
			format.html
			format.json { render json: @reservations}
		end
	end

	def new
		@reservation = Reservation.new

		respond_to do |format|
			format.html
			format.json { render json: @reservations}
		end
	end

	def create
		@reservation = @restaurant.reservations.build(params[:reservation])
		@reservation.user_id = current_user.id

		if @reservation.save 
			redirect_to restaurants_url #change that to redirect to the users show page to display their reservations
		else
			render :new
		end
	end

	def show

	end

	def destroy

	end

	def edit

	end

	def update 

	  	if @reservation.update_attributes(params[:reservation])
	  		format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
	        format.json { head :no_content }
	  	else 
	  		format.html { render action: "edit" }
	        format.json { render json: @reservation.errors, status: :unprocessable_entity }
	  	end
	end

	def manage_reservation
		# @users_reservations = current_user.reservations 
		#shows the current users restaurants only
	end

	private
		def get_reservation
	    	@reservation = Reservation.find(params[:id])
	  	end

		def get_restaurant
	    	@restaurant = Restaurant.find(params[:restaurant_id])
	  	end
end
