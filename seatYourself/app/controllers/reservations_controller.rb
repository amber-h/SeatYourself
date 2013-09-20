class ReservationsController < ApplicationController

	before_filter :get_reservation, :only => [:show, :edit, :destroy, :update]

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

	def show

	end

	def edit

	end

	def destroy

	end

	def update

	end

	private
	  def get_restaurant
	    @reservation = Reservation.find(params[:id])
	  end

end
