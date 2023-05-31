class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy]

  # GET /restaurants/:restaurant_id/reviews/new
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build
  end

  # POST /restaurants/:restaurant_id/reviews
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build(review_params)

    if @review.save
      redirect_to restaurant_path(@restaurant), notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  # DELETE /reviews/1
  def destroy
    @restaurant = @review.restaurant
    @review.destroy
    redirect_to restaurant_path(@restaurant), notice: 'Review was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
