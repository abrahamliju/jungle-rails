class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    # binding.pry
    @product = Product.find params[:product_id]
    @review = current_user.reviews.new(review_params)
    @review.product_id = params[:product_id]
    @review.save
    if @review.save
      redirect_to product_path(@product), notice: 'Your review has been added'
    else
      redirect_to product_path(@product), notice: 'The review could not be added'
    end
  end

  def destroy
    @product = Product.find params[:product_id]
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(@product), notice: 'Your comment has been deleted.'
  end

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end
end
