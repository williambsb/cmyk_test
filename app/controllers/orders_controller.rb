class OrdersController < ApplicationController

  def show
    @order = ShopifyAPI::Order.find(params[:id])
  end

  def create
    @order = ShopifyAPI::Order.new line_items: session[:cart].line_items
    if order.save!
      render :show
    else
      render :new
    end
  end

end
