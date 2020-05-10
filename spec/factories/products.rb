FactoryBot.define do
  factory :product do
    shopify_id { "yolo" }
    shopify_product_type { "yolo" }
    shopify_title { "yolo" }
    shopify_available_for_sale { true }
    shopify_image_url { "yolo" }
    shop_id { nil }
  end
end
