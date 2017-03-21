class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def new

    #binding.pry
  end

  def show
    @product = Product.find params[:id]
    # binding.pry
    @review = Review.new(product: @product)
    @reviews_rating = @reviews_rating = @product.reviews.map{ |ele| ele.rating}
    @reviews_rating = @reviews_rating.inject(&:+) / @reviews_rating.size
  end

end
