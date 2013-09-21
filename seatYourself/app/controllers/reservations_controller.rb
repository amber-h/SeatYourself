class ReservationsController < ApplicationController

	before_filter :get_reservation, :only => [:show, :edit, :destroy, :update]
	before_filter :get_restaurant

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

	private
		def get_reservation
	    	@reservation = Reservation.find(params[:id])
	  	end

	private
		def get_restaurant
	    	@restaurant = Restaurant.find(params[:restaurant_id])
	  	end
end
