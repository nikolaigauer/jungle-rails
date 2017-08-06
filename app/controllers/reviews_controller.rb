class ReviewsController < ApplicationController
  before_action require_login

  # GET /reviews
  # GET /reviews.json
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.product_id = params[:product_id]
    if @review.save
      redirect_to product_path(@review.product_id)
    end
  end

  def review_params
    params.require(:review).parmit(:rating, :description)
  end

  def destroy
    @review.destroy
    redirect_to @review.product, notice: 'Review was successfully deleted.'
  end

  private
    def logged_in?
      if(current_user)
        true
      else
        false
      end
    end

    def require_login

      unless logged_in?
        flash[:error] = "you mus be logged in to access this section"
        redirect_to '/login'
      end
    end
end
