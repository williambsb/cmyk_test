FactoryBot.define do
  factory :line_item do
    cart { nil }
    quantity { 1 }
    shopify_product_id { "" }
  end
end
