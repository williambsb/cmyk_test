FactoryBot.define do
  factory :shop do
    shopify_domain { 'cmyk-test-store.myshopify.com' }
    shopify_token { "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" }
    shopify_currency_code { nil }
    shopify_money_format { nil }
    currency_code { "EUR" }
    language { "en" }
    notifications { false }
  end
end
