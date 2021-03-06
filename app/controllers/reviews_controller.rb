class ReviewsController < ApplicationController

  before_filter :authorize, only: :create
  
  def create
    @product = Product.find params[:product_id].to_i
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to :products, notice: 'Review submitted'
    else
      render @product
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

end
