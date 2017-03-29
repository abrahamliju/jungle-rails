class CartsController < ApplicationController

  def show
  end

  def add_item
    product_id = params[:product_id].to_s
    # pry
    @product = Product.find(params[:product_id])
    item = cart[product_id] || { "quantity" => 0 }
    item["quantity"] += 1
    cart[product_id] = item
    update_cart cart
    @product.quantity -=1
    @product.save

    redirect_to :back
  end

  def remove_item
    product_id = params[:product_id].to_s
    @product = Product.find(params[:product_id])
    item = cart[product_id] || { "quantity" => 1 }
    item["quantity"] -= 1
    cart[product_id] = item
    cart.delete(product_id) if item["quantity"] < 1
    update_cart cart
    @product.quantity +=1
    @product.save
    redirect_to :back
  end

end
