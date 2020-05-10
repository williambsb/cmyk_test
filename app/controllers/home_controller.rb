# frozen_string_literal: true

class HomeController < ApplicationController #AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)
    @orders = ShopifyAPI::Order.find(:all)
    @session = ShopifyAPI::Base.session
  end
end
