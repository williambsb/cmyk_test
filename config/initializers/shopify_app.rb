ShopifyApp.configure do |config|
  config.application_name = "cmyk_proof"
  config.api_key = ENV['api_key']
  config.secret = ENV['api_secret']

  config.old_secret = ""
  config.scope = "read_products, read_orders, write_orders, write_checkouts, read_checkouts" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.after_authenticate_job = false
  config.api_version = "2020-04"
  config.shop_session_repository = 'Shop'
end

# ShopifyApp::Utils.fetch_known_api_versions                        # Uncomment to fetch known api versions from shopify servers on boot
# ShopifyAPI::ApiVersion.version_lookup_mode = :raise_on_unknown    # Uncomment to raise an error if attempting to use an api version that was not previously known
