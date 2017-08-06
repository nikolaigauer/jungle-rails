class ReviewsController < ApplicationController
  before_action require_login

  # GET /reviews
  # GET /reviews.json
  def create
    @product = Product.find(params[:product_id])

    @review = @product.reviews.new(review_params)

    if @review.save
      redirect_to @product, notice: 'Review was successfully created.'
    else
      redirect_to @product, notice: 'Review failed to save.'
    end
  end

  def destroy
    @review.destroy
    redirect_to @review.product, notice: 'Review was successfully destroyed.'
  end

  private
    def set_review
      @egg = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:description, :rating)
    end
end
