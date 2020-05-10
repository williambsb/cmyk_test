class AddShopifyProductIdToLineItem < ActiveRecord::Migration[6.0]
  def change
    add_column :line_items, :shopify_product_id, :bigint
  end
end
