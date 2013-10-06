class ReviewsController < ApplicationController
  before_filter :load_restaurant

  def show
  	@review = Review.find(params[:id])
  end

  def create
  	@review = @restaurant.reviews.build(params[:review])
  	@review.user_id = current_user.id

    respond_to do |format|
    	if @review.save
    		format.html { redirect_to restaurant_path(@restaurant.id), notice: 'Review added.' }
        format.js {} # This will look for /views/reviews/create.js.erb
    	else
    		format.html { render "restaurants/show", notice: 'There was an error.'  }
        format.js {} # This will look for /views/reviews/create.js.erb
    	end
    end
  end

  def new
  end

  def edit
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
  end

  private 
  def load_restaurant
  	@restaurant = Restaurant.find(params[:restaurant_id])
  end
end
