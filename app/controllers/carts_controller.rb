class CartsController < ApplicationController

  def create
  end

  def update
  end

  def show
    @product = ShopifyAPI::Product.first
    @titles = ShopifyAPI::Product.find(:all).map(&:title)
  end

  def destroy
    @cart.destroy! if @cart.id == session[:cart_id]

    session[:cart_id] = nil
    redirect_to products_path
  end

end
