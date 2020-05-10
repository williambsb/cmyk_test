class ApplicationController < ActionController::Base

  layout "embedded_app"

  before_action :init_session, :set_cart

  private

  def init_session
    session = ShopifyAPI::Session.new(
      domain: "cmyk-test-store.myshopify.com",
      api_version: Shop.first.api_version,
      token: Shop.first.shopify_token
    )
    ShopifyAPI::Base.activate_session(session)
  end

  def set_cart
    unless session[:cart_id]
      session[:cart_id] = Cart.create.id
    end
    @cart = Cart.find(session[:cart_id])
  end

end
