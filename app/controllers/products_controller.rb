class ProductsController < ApplicationController

  def index
    session[:product_id] = nil
    @products = ShopifyAPI::Product.all
  end

  def show
    @product = ShopifyAPI::Product.find(params[:id])
    session[:product_id] = @product.id
    # @image = Image.new
  end

end
