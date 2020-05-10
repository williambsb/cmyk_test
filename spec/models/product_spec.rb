require 'rails_helper'

RSpec.describe ShopifyAPI::Product, type: :model do
  before :all do
    session = ShopifyAPI::Session.new(
        domain: "cmyk-test-store.myshopify.com",
        token: "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",
        api_version: ShopifyApp.configuration.api_version)
    ShopifyAPI::Base.activate_session(session)
  end

  it 'exists' do
    expect(ShopifyAPI::Product.first).to exist
  end
  it 'is valid' do
    expect(ShopifyAPI::Product.first).to be_valid
  end

end
