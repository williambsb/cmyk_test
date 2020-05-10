class LineItemsController < ApplicationController

  def destroy

    result = LineItemDestroyer.new(
      cart: @cart,
      line_item_id: params[:line_item_id],
    ).call
    #
    if result.success?
      flash[:notice] = 'Destroyed an Item'
      redirect_to cart_path @cart
    else
      flash[:warning] = "#{result.error}"
    end
  end

  def create
    #
    result = LineItemCreator.new(
      cart: @cart,
      product: ShopifyAPI::Product.find(session[:product_id]),
      image: params[:image].permit!,
      options: params[:options].permit!
    ).call
    # TODO: make flashes work
    if result.success?
      flash[:notice] = 'Added an Item'
      redirect_to cart_path @cart
    else
      flash[:warning] = "#{result.error}"
    end
  end

  def update

  end

  def create_from_cart
    result = LineItemCreator.new(
      cart: @cart,
      product: nil,
      image: params[:image].permit!,
      options: nil
    ).from_cart
    # TODO: make flashes work
    if result.success?
      flash[:notice] = 'Added an Item'
      redirect_to cart_path @cart
    else
      flash[:warning] = "#{result.error}"
    end
  end

  private

# TODO: strong params
  def line_items_params
  end

end
