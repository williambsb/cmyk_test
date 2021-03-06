class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.references :cart, null: false, foreign_key: true
      t.integer :quantity
      t.bigint :shopify_variant_id

      t.timestamps
    end
  end
end
